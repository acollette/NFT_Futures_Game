// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "./ISvgContract.sol";


contract BullOrBear is ERC721, Ownable {

    ISvgContract private SvgContract;
    uint16 public immutable totalSupply;
    uint16 public mintedAmount = 0;
    uint64 ethPrice;
    //uint64 ethPricePreviousClose;
    uint256 nextDistribution = 1660262400;
    uint256 lastDistribution = 1660262400 - 24 hours;
    uint256 amountToDistribute;
    uint8 winPosition;
    uint256 previousBears;
    uint256 previousBulls;
    uint256 bulls;
    uint256 bears;
    uint256 amountToTransferPerWinner;

    mapping (uint256 => TokenIdPosition) tokenIdPosition;

    // 2: Bull, 1: Neutral, 0: Bear
    struct TokenIdPosition {
        uint8 tokenPosition;
        uint256 timeStamp;
        bool claimed;

    }
    constructor(uint16 _totalSupply) ERC721("BullOrBear", "BOB"){
        totalSupply = _totalSupply;

    }

    function getTotalSupply() public view returns (uint16 totalSupply_){
        totalSupply_ = totalSupply;
    }


    function mint () external payable {
        require(msg.value >= 0.003 ether && mintedAmount < totalSupply, "Amount is less than 0.003 ETH or Supply exceeded");
        mintedAmount++;
        _safeMint(msg.sender, mintedAmount);
    }

    function getTokenIdPosition(uint256 _tokenId) public view returns(uint8, uint256){
        return (tokenIdPosition[_tokenId].tokenPosition, tokenIdPosition[_tokenId].timeStamp);

    }

    fallback() external payable {}
    receive() external payable {}


    function changePosition (uint256 _tokenId, uint8 _position) external payable {
        require(ownerOf(_tokenId) == msg.sender, "You don't own specified token");
        require (msg.value >= 0.003 ether);
        require(block.timestamp < nextDistribution - 18 hours);
        require(_position ==2 || _position == 0, "number not applicable");
        
        tokenIdPosition[_tokenId].tokenPosition = _position;
        tokenIdPosition[_tokenId].timeStamp = block.timestamp; 
        tokenIdPosition[_tokenId].claimed = false;

        if(_position == 2){
            bulls++;
        } else if (_position == 0){
            bears++;
        }

    }

    function claimReward (uint256 _tokenId) external {
        require(ownerOf(_tokenId) == msg.sender, "You don't own specified token");
        require (lastDistribution - tokenIdPosition[_tokenId].timeStamp <= 24 hours && lastDistribution - tokenIdPosition[_tokenId].timeStamp > 0 );
        require (tokenIdPosition[_tokenId].tokenPosition == winPosition);
        require(tokenIdPosition[_tokenId].claimed == false, "Reward already claimed");
        tokenIdPosition[_tokenId].claimed = true;

        if(winPosition ==2){
            payable(msg.sender).transfer(amountToDistribute/previousBulls );
        }else if(winPosition ==0){
            payable(msg.sender).transfer(amountToDistribute/previousBears );

        }

        ////////
        //check proportion of previousBears
        //attention à ne pas pouvoir claimer plusieurs fois.

        //attention si je change de position tout juste au début, ca fera moins de 24h et je pourrai changer et claim.
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory){
        require(_exists(_tokenId), "ERC721 nonexistent token");

        string memory svgCode = SvgContract.getSVG(_tokenId);

        string memory image = string(
            abi.encodePacked(
                "data:image/svg+xml;base64,",
                Base64.encode(bytes(abi.encodePacked(svgCode)))
            )
        );

        string memory metadata = string(abi.encodePacked('{"description": "Bulls vs Bears ", "image": "', image, '", "attributes": [ {"trait_type": "B ?", "value": "See NFT Image"}]}'));

        return metadata;

    }

    function setSvgContract (ISvgContract _address) external onlyOwner {
        SvgContract = _address;
    }

    function distributeRewards (uint64 _newEthPrice) external onlyOwner  {
        require( block.timestamp - nextDistribution > 0, "min 24h have to pass");
        uint256 timelapse = block.timestamp - nextDistribution;
        uint64 percentage = (_newEthPrice * 100)/ ethPrice;
        lastDistribution = nextDistribution;
        nextDistribution = nextDistribution + 24 hours - timelapse;
        setLastEthPrice(_newEthPrice);

        if(percentage < 99){
            amountToDistribute = address(this).balance;
            winPosition = 0;
            previousBears = bears;
            previousBulls= bulls;
            bulls = 0;
            bears = 0;


        }else if (percentage >101){
            amountToDistribute = address(this).balance;
            winPosition = 2;
            previousBears = bears;
            previousBulls = bulls;
            bulls = 0;
            bears = 0;
    
        }
       
    }

    function setLastEthPrice(uint64 _newPrice) private {
        ethPrice = _newPrice;

    }



   //Distribute to winners
   //Set Time-Limit to decide (je peux cloner pour one week avec plus gros montants)
   //Si fluctue pas plus que -1 +1 % alors garde pour redistribuer aux gagnants le lendemain
    // que tout owner peut activer la fonction distribute 1x max par jour
    //utiliser chainlink

    //change NFT to neutral si plus changé depuis 24h

    
}
