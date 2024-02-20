// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC721, ERC721URIStorage, Ownable {
    uint256 private _nextTokenId;
    string[3] private _uri;

    constructor(address initialOwner)
        ERC721("MyToken", "MTK")
        Ownable(initialOwner)
    {
        //Point to RAW metadata
        string[0] = "https://raw.githubusercontent.com/Qwerky7835/NFT-Test/main/BoredApe1.json";
        string[1] = "https://raw.githubusercontent.com/Qwerky7835/NFT-Test/main/BoredApe2.json";
        string[2] = "https://raw.githubusercontent.com/Qwerky7835/NFT-Test/main/BoredApe3.json";
    }

    function safeMint(address to, string memory uri) public onlyOwner {
        _safeMint(to, _nextTokenId);
        _setTokenURI(_nextTokenId, _uri[_nextTokenId]);
        _nextTokenId++;
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}