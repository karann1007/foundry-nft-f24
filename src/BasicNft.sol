//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {ERC721} from '@openzeppelin-contracts/contracts/token/ERC721/ERC721.sol';

contract BasicNft is ERC721 {

    uint256 public s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721('Dogie','DOG') {
        s_tokenCounter = 0;
    }

    function mintNft(string memory _tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = _tokenUri;
        _safeMint(msg.sender,s_tokenCounter);
        s_tokenCounter++;
    }


    // This returns an API endpoint of metadata of that NFT
    function tokenURI(uint256 tokenId) public view override returns (string memory){
        return s_tokenIdToUri[tokenId];
    }
}