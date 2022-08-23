// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./IBullOrBear.sol";


contract BullBearSVG {

    IBullOrBear private immutable mainContract;

    constructor (IBullOrBear _mainContract){
        mainContract = _mainContract;

    }

    function getSVG (uint256 _tokenID) external view returns (string memory _svgcode){
        uint8 position;
        uint256 timestamp;
        (position, timestamp) = mainContract.getTokenIdPosition(_tokenID);
        if(position == 2 && block.timestamp - timestamp < 24 hours){
            return bull;
        } else if (position == 0 && block.timestamp - timestamp < 24 hours){
            return bear;
        } else {
            return neutral;
        }

    }

    string bull = string(abi.encodePacked(
        '<svg xmlns=''"http://www.w3.org/2000/svg"' ' version=''"1.0"'" " 'width=''"250.000000pt"'" " 'height=''"291.439.000000pt"'" " 'viewBox=''"0 0 250 291.439"' ' preserveAspectRatio=''"xMidYMid meet"''><metadata>'
        'Created by potrace 1.15, written by Peter Selinger 2001-2017'
        '</metadata><g transform=''"translate(0.000000,291.000000) scale(0.100000,-0.100000)"'" " 'fill=''"#000000"'" " 'stroke=''"none"''><path d=''"M198.998 2904.827c6.148 -36.202 12.75 -138.206 12.75 -194.444 0 -97.222 -10.701 -175.319 -36.658 -268.215 -5.009 -17.76 -23.224 -74.681 -40.756 -126.594 -49.636 -147.996 -63.752 -195.583 -86.521 -286.885 -21.175 -85.155 -35.291 -155.51 -43.488 -216.302 -4.098 -29.144 -4.098 -125 0 -151.412 14.344 -97.905 47.359 -174.863 103.142 -241.348 58.288 -69.672 151.639 -129.554 240.893 -154.827 8.197 -2.277 15.483 -4.781 16.393 -5.464 0.911 -0.911 -2.049 -20.947 -6.375 -44.627 -9.563 -51.457 -11.612 -81.512 -7.969 -120.902 3.871 -41.894 17.76 -121.129 22.769 -130.237 1.366 -2.277 5.692 0 16.393 9.107 48.27 40.528 78.78 61.475 99.044 67.851 27.778 8.424 108.379 20.492 139.117 20.492 9.335 0 9.791 -0.228 16.621 -13.206 3.871 -7.286 12.523 -20.719 19.581 -29.827 22.086 -29.372 24.818 -36.43 66.712 -167.122 37.568 -116.576 63.069 -186.931 90.164 -247.495 21.63 -48.497 31.193 -80.146 39.162 -129.781 2.96 -19.809 3.871 -44.171 4.098 -141.166 0.455 -121.812 1.366 -138.206 10.701 -168.488 8.197 -26.867 20.719 -43.716 50.774 -68.306 60.109 -49.18 136.84 -79.69 229.736 -91.53 13.889 -1.821 45.537 -2.96 79.918 -2.732 90.392 0.228 140.71 8.652 184.426 30.51 73.315 36.658 126.821 107.013 168.26 221.084 15.483 43.033 27.55 86.293 61.475 222.222 17.077 67.851 33.698 131.831 36.885 142.304 11.84 37.341 25.729 60.109 55.556 91.758 8.197 8.652 17.76 20.492 20.947 26.184 30.738 52.823 61.703 200.592 84.699 405.055 3.188 28.005 6.375 51.457 6.831 51.913 0.455 0.455 19.581 -4.781 42.577 -11.612 52.823 -15.71 82.65 -23.907 163.707 -45.765 100.865 -26.867 191.485 -55.328 236.566 -73.77l16.849 -7.058 -1.366 17.077c-3.871 44.627 -27.55 124.089 -50.546 169.399 -10.929 21.63 -34.153 53.506 -54.417 74.681 -19.809 20.947 -53.734 49.18 -68.306 57.149 -7.058 3.871 -6.831 3.871 19.126 5.237 72.404 4.326 143.443 33.242 207.195 84.244 57.377 45.765 83.561 89.026 106.102 173.953 19.353 73.77 26.867 144.581 26.867 253.871 0.228 81.967 -1.594 113.16 -10.246 183.288 -12.75 103.37 -38.024 206.967 -67.168 275.046 -25.501 59.199 -36.658 101.548 -43.033 160.974 -11.612 107.468 10.246 243.625 56.922 357.013 5.692 13.206 9.791 24.59 9.107 25.046 -1.821 1.821 -67.851 -31.421 -86.976 -44.171 -92.668 -60.337 -145.719 -147.541 -163.479 -267.987 -13.206 -91.302 -9.335 -186.248 15.938 -379.554 15.255 -117.031 15.71 -123.634 15.938 -201.503 0 -66.712 -0.455 -74.909 -5.009 -98.133 -20.719 -101.321 -72.177 -160.064 -197.632 -225.41 -85.61 -44.627 -139.117 -56.011 -201.503 -43.033 -39.162 8.197 -77.413 26.412 -166.211 79.69 -104.964 62.842 -173.953 94.945 -252.049 117.259 -113.16 32.332 -205.601 35.064 -307.149 9.107 -75.82 -19.581 -162.796 -63.069 -244.308 -122.495 -13.206 -9.563 -49.408 -37.796 -80.373 -62.386 -30.965 -24.59 -62.386 -48.953 -69.444 -53.734 -25.273 -17.077 -53.051 -28.689 -85.838 -36.202 -24.362 -5.464 -70.355 -4.781 -93.579 1.366 -23.224 6.148 -54.872 21.858 -74.226 36.43 -38.479 29.372 -78.78 82.423 -90.619 119.536 -10.701 33.47 -12.75 50.319 -12.523 101.548 0.228 53.506 3.415 86.749 18.215 186.703 26.639 180.783 31.193 218.124 35.291 290.528 8.424 149.362 -17.987 284.381 -83.333 426.685 -24.59 53.962 -64.891 121.129 -99.271 166.667 -16.166 21.175 -18.67 22.996 -17.077 12.75z"''/></g></svg>'
    ));

    string bear = string(abi.encodePacked(
        '<svg xmlns="http://www.w3.org/2000/svg"' ' version="1.0"' ' width="220.000000pt"' ' height="235.452.000000pt"' ' viewBox="0 0 220 235.452"' ' preserveAspectRatio="xMidYMid meet"''><metadata> Created by potrace 1.15, written by Peter Selinger 2001-2017'
        '</metadata><g transform=''"translate(0.000000,235.000000) scale(0.100000,-0.100000)"' ' fill="#000000"' ' stroke="none"''><path d=''"M204.181 2342.007l-30.351 -12.324 -5.702 -11.957 -5.886 -11.957 -0.736 11.405 -0.552 11.589 -11.037 -18.579c-6.07 -10.301 -12.324 -19.13 -13.98 -19.866 -1.656 -0.552 -6.07 -4.783 -9.749 -9.197 -16.739 -20.05 -28.144 -47.458 -33.846 -81.672 -1.839 -10.669 -4.231 -20.418 -5.334 -21.89 -3.495 -4.231 -11.221 -37.525 -13.428 -57.575 -1.104 -11.037 -1.288 -24.465 -0.368 -33.478 0.736 -8.462 1.104 -15.268 0.552 -15.268 -0.552 0 -3.311 2.207 -6.254 4.967l-5.151 5.151 1.104 -19.314c6.806 -113.679 26.304 -175.669 68.244 -217.793 4.967 -4.967 13.428 -11.957 18.763 -15.452 5.334 -3.679 9.013 -7.174 8.278 -7.91 -0.736 -0.736 -8.829 -3.863 -17.843 -6.806l-16.187 -5.518 7.726 -5.702c4.415 -3.127 8.645 -5.702 9.565 -5.702 4.231 0 0.736 -3.495 -4.783 -4.415 -3.311 -0.736 -7.542 -2.759 -9.381 -4.783 -3.127 -3.495 -2.943 -3.495 8.829 -4.047l12.14 -0.552 -24.097 -25.201c-13.06 -13.98 -25.017 -25.385 -26.304 -25.385 -1.288 0 -3.495 -1.472 -4.783 -3.127 -1.839 -2.023 -1.839 -2.575 -0.368 -1.656 1.288 0.736 2.391 1.104 2.391 0.736 0 -0.368 -4.415 -9.749 -9.933 -20.786 -5.334 -11.221 -9.565 -20.418 -9.381 -20.786 0.368 -0.368 5.518 2.023 11.773 4.967 11.957 6.07 12.692 6.07 8.645 -0.368 -4.047 -6.07 -11.589 -30.903 -16.739 -55 -5.334 -24.833 -5.151 -24.097 -2.759 -22.625 1.104 0.736 1.472 -0.92 0.92 -4.047 -1.656 -10.485 -3.311 -46.171 -2.943 -62.358 0.736 -28.696 -4.415 -46.906 -18.027 -64.013 -3.127 -3.863 -5.702 -7.358 -5.702 -7.91 0 -0.368 4.967 2.023 11.221 5.151 6.254 2.943 11.405 5.334 11.773 4.967 1.104 -0.92 -4.231 -23.913 -7.91 -34.766 -6.254 -17.843 -15.819 -36.973 -36.605 -72.659 -19.866 -34.214 -26.304 -45.619 -26.304 -47.458 0 -0.552 4.231 0.92 9.197 2.943 5.151 2.023 9.749 3.495 10.117 2.943 0.552 -0.552 -0.368 -4.047 -2.023 -8.094 -1.656 -3.863 -6.254 -15.452 -9.933 -25.569 -3.863 -10.117 -7.542 -20.05 -8.278 -22.074 -0.736 -2.023 4.047 1.656 10.853 8.278l12.324 11.957 -2.943 -8.278c-7.174 -20.234 -10.669 -49.298 -10.669 -87.742 0 -25.017 0.736 -38.077 2.023 -39.732 1.656 -1.839 1.472 -3.495 -0.92 -6.622 -2.759 -4.047 -2.759 -4.231 1.104 -2.207 2.207 1.288 4.967 3.863 6.254 5.702 1.104 2.023 3.863 3.679 5.886 3.679 3.495 -0.184 3.679 -0.184 0.184 -2.759 -1.839 -1.472 -4.231 -2.943 -4.967 -3.127 -1.472 -0.552 -9.197 -42.124 -8.278 -43.411 0.368 -0.184 5.702 7.174 11.957 16.555 6.438 9.381 11.037 15.084 10.485 12.508 -0.736 -2.575 -5.702 -22.809 -11.221 -45.251 -5.518 -22.258 -10.117 -41.388 -10.117 -42.308 0 -0.92 2.391 2.575 5.518 7.542 2.943 5.151 8.094 12.324 11.405 16.187l6.07 7.174 -0.552 -30.535c-0.368 -16.739 0.184 -30.535 1.104 -30.535 0.736 0 2.575 2.943 3.863 6.622 3.863 10.669 4.415 5.702 0.552 -5.702 -2.023 -5.702 -4.047 -9.381 -4.415 -8.094 -1.288 3.311 -6.07 -8.094 -11.589 -27.408 -5.518 -18.579 -8.829 -43.779 -7.358 -55.368 2.023 -16.555 4.967 -31.455 6.254 -31.455 0.552 0 3.495 9.933 6.254 22.258 2.943 12.14 5.702 21.89 6.07 21.338 0.368 -0.368 5.334 -22.809 10.853 -49.849 8.462 -41.756 13.244 -72.843 13.98 -90.134 0 -2.023 2.943 4.047 6.254 13.612 3.863 11.221 6.254 15.635 6.254 12.508 0.184 -2.759 2.575 -16.371 5.518 -30.351 2.943 -13.98 5.702 -27.776 6.07 -30.903 0.368 -4.415 1.472 -2.575 5.886 10.669 3.127 9.013 6.07 16.555 6.806 17.107 2.759 1.656 29.064 -73.763 34.214 -97.676 1.288 -6.622 1.472 -5.886 2.391 8.278l0.92 15.635 7.91 -15.452c8.645 -16.555 14.164 -35.686 16.003 -55.92l1.288 -12.508 5.151 11.037c2.943 6.254 5.702 11.221 6.07 11.221 0.552 0 0.368 -3.679 0 -8.094 -0.552 -4.599 -0.368 -18.763 0.368 -31.455l1.288 -23.361 4.967 7.174 4.783 6.99 0.92 -30.167 0.92 -30.351 11.405 23.361c6.254 12.876 11.773 23.361 11.957 23.361 0.368 0 0.368 -6.806 0 -15.084 -0.184 -8.462 0.184 -27.224 0.92 -41.94l1.472 -26.488 17.843 17.107c15.452 14.716 18.027 16.555 18.027 12.876 0.184 -9.013 5.518 -29.064 13.98 -52.241 8.829 -23.913 11.773 -30.167 11.773 -24.281 0 1.839 4.967 13.796 11.037 26.672 6.07 13.06 11.037 25.201 11.221 27.224 0 1.839 1.656 -1.839 3.495 -8.462 2.023 -6.622 7.726 -22.625 12.692 -35.686l9.013 -23.545 2.023 8.829c1.104 4.967 3.863 15.084 6.254 22.625l4.231 13.612 3.127 -14.532c1.839 -7.91 7.358 -24.097 12.324 -35.686l9.013 -21.154 0.552 23.913 0.552 23.729 5.702 -14.532c3.127 -8.094 11.405 -27.408 18.395 -42.86l12.692 -27.96 5.886 11.405c5.334 10.485 5.886 11.037 6.07 6.07 0 -6.254 3.679 -22.993 9.013 -42.308 3.127 -11.773 3.679 -12.508 4.783 -7.358 2.943 12.508 10.301 40.284 10.853 40.836 0.368 0.368 1.104 -4.047 1.839 -9.933 2.207 -19.866 8.829 -62.174 10.301 -65.853 1.288 -2.943 1.656 -2.391 1.656 2.759 0.184 3.495 2.575 15.635 5.334 27.04l5.151 20.602 3.127 -16.371c2.575 -14.164 17.843 -59.047 21.338 -62.91 0.552 -0.736 1.104 11.589 1.104 27.224 0 15.452 0.368 28.328 0.92 28.328 1.288 0 24.465 -36.237 30.535 -47.826l5.334 -10.117 0.552 16.555 0.736 16.555 11.589 -22.993 11.773 -22.993 0 11.957 0.184 11.957 18.579 -18.395 18.579 -18.395 -5.886 10.669c-3.311 5.886 -5.702 11.037 -5.334 11.405 0.368 0.368 12.324 -7.358 26.488 -16.923 26.672 -18.211 48.562 -29.983 55.368 -29.983 9.565 0 48.194 -22.441 83.144 -48.194 9.197 -6.806 17.291 -12.508 17.659 -12.508 0.368 0 -1.656 4.415 -4.599 9.749 -2.943 5.151 -5.334 10.117 -5.334 11.037 0 0.736 9.565 -5.702 21.154 -14.348 11.773 -8.645 30.719 -22.258 42.308 -30.351l21.154 -14.532 0 12.324 0 12.324 25.017 -24.833 25.017 -24.833 -5.702 11.405 -5.702 11.405 12.508 -9.381c16.003 -12.14 40.284 -23.913 51.873 -25.017 8.278 -0.736 9.749 -1.656 18.579 -12.14 13.244 -15.635 18.027 -23.177 22.993 -36.421l4.231 -11.589 0 16.555 0.184 16.555 11.221 -22.074c6.254 -12.14 14.532 -28.328 18.395 -35.87l6.99 -13.796 0.184 22.993c0.184 14.9 0.736 21.706 1.839 19.314 10.117 -23.177 20.05 -46.722 21.154 -50.033 0.552 -2.391 1.656 -4.231 2.391 -4.231 0.736 0.184 5.518 6.806 10.485 14.9 12.692 20.418 14.716 21.154 8.462 3.311 -5.702 -16.371 -6.254 -20.786 -0.92 -10.485 3.495 6.806 41.02 62.174 42.124 62.174 0.368 0 -1.656 -7.174 -4.783 -16.003 -2.943 -8.829 -5.334 -16.371 -5.334 -16.739 0 -0.368 2.759 2.759 6.254 6.806 3.495 4.231 13.244 13.98 21.706 21.706 8.462 7.726 18.946 17.475 23.361 21.522l7.91 7.542 -3.863 -7.726c-2.207 -4.231 -3.863 -8.278 -3.863 -8.829 0 -1.656 25.385 30.167 29.064 36.237 4.599 7.91 6.438 6.07 5.518 -5.886 -0.92 -12.14 -2.207 -12.14 13.244 0 14.716 11.773 34.214 24.833 30.351 20.418 -2.023 -2.391 11.589 5.702 30.351 18.211 18.763 12.508 32.375 20.602 30.351 18.211 -3.495 -4.047 -3.311 -4.047 2.943 0.552 8.829 6.438 49.666 29.431 50.769 28.328 0.368 -0.368 -1.288 -4.967 -3.863 -10.117 -5.886 -11.405 -5.886 -12.876 -0.552 -8.094 7.174 6.806 31.087 21.154 54.632 33.11 12.692 6.254 23.545 11.589 24.465 11.589 0.736 0 -1.288 -5.151 -4.415 -11.405l-5.702 -11.221 9.013 6.438c8.829 6.622 50.217 28.144 50.217 26.304 0 -0.552 -2.207 -5.334 -4.783 -10.669l-4.783 -9.565 6.07 5.886c5.702 5.151 38.997 28.144 41.02 28.144 0.552 0 -1.656 -7.174 -4.599 -16.003 -2.943 -8.829 -5.151 -16.739 -4.783 -17.659 0.184 -0.736 13.796 11.589 30.167 27.592l29.615 29.064 -5.334 -15.452c-2.943 -8.645 -5.151 -15.819 -4.783 -16.003 0.552 -0.552 28.328 32.742 37.893 45.803 4.415 5.702 8.278 10.485 8.645 10.485 0.368 0 -0.184 -2.023 -1.104 -4.415 -0.92 -2.391 -2.943 -10.853 -4.783 -18.946 -1.656 -7.91 -3.495 -16.371 -4.047 -18.763 -0.92 -4.415 -0.92 -4.415 7.174 1.288 9.749 6.806 27.96 25.385 44.331 45.435 12.876 15.635 19.866 22.809 19.866 20.05 0 -0.92 -1.288 -5.702 -2.943 -10.853 -3.127 -10.301 -8.094 -32.742 -6.99 -31.639 0.368 0.368 4.415 8.278 9.013 17.659 17.291 35.502 36.973 56.656 59.415 63.645 3.863 1.104 2.943 -1.288 -7.91 -23.361l-12.324 -24.465 8.645 8.278c4.783 4.599 15.452 16.555 23.729 26.672 8.462 10.117 18.946 21.89 23.545 25.936 8.094 7.542 16.187 12.876 16.187 10.853 0 -0.552 -3.863 -6.07 -8.462 -12.324 -4.599 -6.438 -9.381 -13.244 -10.485 -15.268 -9.197 -17.291 33.662 38.813 48.01 62.726l9.565 16.187 0 -18.395 0 -18.211 4.783 8.278c16.003 27.408 31.823 50.953 39.732 59.047 1.656 1.656 8.829 14.348 16.003 28.512 6.99 13.98 12.876 24.833 12.876 23.729 0.184 -0.92 -2.207 -10.853 -5.151 -22.074 -2.943 -11.037 -5.151 -20.418 -4.783 -20.786 0.92 -1.104 37.341 50.217 46.722 65.853 10.301 17.475 21.338 43.411 23.545 55.552 1.288 7.174 1.472 6.622 2.391 -7.726l0.92 -15.635 10.485 16.555c6.07 9.381 17.843 24.097 27.592 34.03 9.381 9.565 25.385 27.776 35.318 40.468 23.177 29.247 24.649 30.719 18.579 18.395 -5.886 -12.14 -5.334 -11.405 20.786 20.418 16.739 20.602 36.421 47.826 45.435 63.278 1.288 2.207 1.839 -1.472 1.472 -13.244 -0.368 -17.107 -0.184 -16.923 6.806 2.759 4.047 11.405 14.532 28.328 32.559 52.793 5.151 7.174 12.324 17.659 16.003 23.545 6.07 10.301 6.438 10.485 7.174 5.518 0.736 -4.599 0.736 -4.415 1.104 1.288 0.184 3.495 2.207 20.05 4.783 36.789 2.575 16.555 5.151 36.605 5.702 44.515 0.736 7.91 1.839 14.348 2.575 14.348 2.575 0 14.532 26.488 18.579 41.388 3.311 11.589 4.231 19.866 4.231 38.997 0.184 13.244 0.368 23.913 0.736 23.729 0.184 -0.368 2.943 -7.542 5.886 -16.003l5.518 -15.452 -0.92 19.314c-0.552 10.669 -3.127 35.502 -5.702 55.184 -2.575 19.682 -5.151 49.666 -5.702 66.773 -0.92 27.592 -1.472 30.719 -4.231 30.719 -2.391 0 -4.231 3.495 -7.358 13.428 -2.207 7.174 -5.518 17.843 -7.358 23.361 -4.047 11.221 -3.679 13.612 0.92 6.622 1.839 -2.575 3.679 -4.783 4.415 -4.783 0.736 0 0.552 8.462 -0.184 18.946 -4.599 56.104 -18.395 109.264 -52.241 198.478 -9.749 25.569 -18.027 48.01 -18.579 49.849 -0.92 2.943 0.552 2.575 10.485 -2.391 8.645 -4.415 11.221 -5.151 10.485 -2.943 -0.736 1.656 -9.749 16.555 -20.234 32.926 -25.936 40.468 -34.766 59.231 -38.813 82.224l-1.104 6.254 6.622 -6.254c6.254 -6.07 6.438 -6.254 5.518 -1.839 -0.552 2.575 -1.839 10.117 -2.943 17.107 -2.391 16.003 -11.589 50.953 -16.371 63.462 -2.207 5.334 -3.863 10.301 -3.863 11.037 0 0.552 5.518 -4.231 12.14 -10.669 11.221 -11.037 11.957 -11.589 10.853 -6.438 -6.07 27.96 -17.659 50.585 -35.318 69.164 -11.405 11.957 -13.612 15.268 -15.084 23.177 -1.104 4.967 -4.231 15.268 -7.174 22.809 -7.358 18.395 -8.278 27.408 -5.151 44.331 4.415 23.361 13.612 37.893 47.274 75.05 23.545 26.304 27.592 31.455 13.98 18.579l-10.301 -9.933 2.391 9.197c6.438 24.649 19.498 51.689 42.676 88.478 8.462 13.244 14.9 24.281 14.348 24.281 -0.368 0 -4.967 -2.023 -9.933 -4.599 -4.967 -2.575 -9.749 -4.599 -10.669 -4.599 -0.92 0 -0.552 7.174 0.736 16.187 12.14 80.753 4.415 144.398 -24.281 199.03 -13.244 25.201 -47.274 58.127 -74.498 71.739 -5.886 3.127 -18.027 7.726 -26.856 10.301 -14.348 4.415 -19.13 4.967 -43.779 4.967 -49.849 0 -84.431 -9.933 -204.181 -59.415 -33.294 -13.612 -82.96 -33.11 -84.799 -33.11 -0.368 0 1.656 4.967 4.783 11.037 2.943 6.07 5.518 11.405 5.518 11.957 0 0.552 -8.094 0.92 -17.843 0.92l-17.843 0 6.07 6.254 6.254 6.438 -7.174 1.839c-71.187 19.13 -188.361 22.074 -256.054 6.622 -15.084 -3.495 -19.866 -2.759 -6.622 0.92 8.094 2.391 8.278 2.575 4.231 4.231 -7.358 2.759 -52.425 3.863 -74.13 1.656 -11.221 -1.288 -34.95 -2.943 -52.793 -4.047 -43.963 -2.575 -91.237 -9.749 -139.431 -20.97l-11.773 -2.759 5.334 5.702c4.231 4.599 4.599 5.518 1.656 4.415 -19.866 -7.358 -33.846 -9.381 -65.301 -9.197 -29.615 0.184 -33.478 0.552 -48.746 5.151 -9.013 2.759 -22.074 7.91 -28.88 11.589 -11.221 5.886 -13.06 6.254 -17.843 4.231 -3.863 -1.472 -7.174 -1.656 -11.589 -0.368 -3.311 1.104 -9.381 2.391 -13.244 2.943l-7.174 0.92 6.254 -6.622c4.783 -4.967 5.334 -6.254 2.575 -5.334 -11.773 3.495 -69.164 10.301 -87.007 10.301l-6.622 0 5.518 -5.702c4.415 -4.783 4.783 -5.518 1.656 -4.783 -13.796 3.863 -48.93 10.669 -64.197 12.508 -20.97 2.391 -37.893 0.736 -68.244 -6.806 -25.569 -6.254 -25.201 -6.07 -14.9 -10.117 5.151 -1.839 10.485 -4.599 11.957 -6.254 2.575 -2.391 1.839 -2.759 -5.886 -2.759 -4.783 0 -27.408 -1.656 -50.401 -3.863 -73.395 -6.622 -111.472 -4.783 -135.201 6.438 -11.221 5.334 -23.545 15.084 -23.545 18.395 0 1.288 -6.438 8.278 -14.348 15.452 -13.796 12.324 -15.268 13.244 -30.535 16.923 -27.408 6.806 -46.906 16.187 -67.324 32.926 -4.415 3.495 -7.358 5.334 -6.438 4.047 1.104 -2.023 0.552 -2.391 -2.943 -1.288 -7.91 2.207 -64.933 10.117 -66.037 9.197 -0.552 -0.552 1.472 -3.127 4.415 -5.518 2.759 -2.575 4.967 -4.967 4.599 -5.151 -1.839 -1.656 -40.652 4.599 -50.217 7.91 -6.07 2.207 -11.037 3.863 -11.037 3.863 -0.184 -0.184 -13.796 -5.702 -30.535 -12.508zm-113.679 -175.117c0.552 -2.943 0.552 -5.518 0.184 -5.518 -1.288 0 -3.863 8.278 -2.943 9.749 1.288 2.391 2.023 1.472 2.759 -4.231zm58.495 -371.572c0 -0.92 -0.92 -1.839 -2.023 -1.839 -0.92 0 -1.288 0.92 -0.736 1.839 0.552 1.104 1.472 1.839 2.023 1.839 0.368 0 0.736 -0.736 0.736 -1.839zm-59.415 -162.609c-4.231 -6.438 -7.91 -11.037 -8.278 -10.117 -0.92 2.391 12.876 21.89 15.635 21.89 0.184 0 -3.127 -5.334 -7.358 -11.773zm2074.916 -690.351c-0.368 -4.967 -0.552 -0.92 -0.552 8.645 0 9.565 0.184 13.612 0.552 8.829 0.368 -4.967 0.368 -12.692 0 -17.475z"''/><path d=''"M4.599 1147.826c-1.839 -2.023 -2.943 -4.047 -2.391 -4.599 0.552 -0.552 2.391 1.104 4.047 3.679 3.679 5.518 2.943 5.886 -1.656 0.92z"''/><path d=''"M172.358 600.401c-0.736 -0.736 -1.288 -2.575 -1.288 -4.231 0 -2.023 0.552 -2.207 2.023 -0.736 1.104 1.104 1.839 2.943 1.288 4.231 -0.368 1.104 -1.288 1.472 -2.023 0.736z"''/></g></svg>'

    ));

    string neutral = string(abi.encodePacked(
        '<svg width="200px"' ' height="200px"' ' viewBox="0 0 20 20"' ' xmlns="http://www.w3.org/2000/svg"''><path d=''"M10 0.4C4.698 0.4 0.4 4.698 0.4 10a9.6 9.6 0 1 0 19.2 -0.001C19.6 4.698 15.301 0.4 10 0.4zm0 17.199a7.6 7.6 0 1 1 0 -15.2 7.6 7.6 0 0 1 0 15.2zm2.5 -11.348c-0.828 0 -1.5 0.783 -1.5 1.749s0.672 1.75 1.5 1.75c0.829 0 1.5 -0.783 1.5 -1.75s-0.671 -1.749 -1.5 -1.749zM7.501 9.75C8.329 9.75 9 8.967 9 8s-0.672 -1.75 -1.5 -1.75S6 7.033 6 8s0.672 1.75 1.501 1.75zM13 12.25H7a0.75 0.75 0 0 0 0 1.5h6a0.75 0.75 0 0 0 0 -1.5z"''/></svg>'
    ));


}