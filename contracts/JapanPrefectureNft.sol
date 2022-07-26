// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// import "../ERC721.sol";

// /**
//  * @dev ERC721 token with storage based token URI management.
//  */
// abstract contract ERC721URIStorage is ERC721 {
//     using Strings for uint256;

//     // Optional mapping for token URIs
//     mapping(uint256 => string) private _tokenURIs;

//     /**
//      * A distinct Uniform Resource Identifier (URI) for a given asset
//      * @dev See {IERC721Metadata-tokenURI}.
//      */
//     function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
//         // super.tokenURI is follow
//         // function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
//         //     _requireMinted(tokenId);

//         //     string memory baseURI = _baseURI();
//         //     return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
//         // } 
//         return super.tokenURI(tokenId);
//     }

//     /**
//      * @dev Sets `_tokenURI` as the tokenURI of `tokenId`.
//      *
//      * Requirements:
//      *
//      * - `tokenId` must exist.
//      */
//     function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
//         require(_exists(tokenId), "ERC721URIStorage: URI set of nonexistent token");
//         _tokenURIs[tokenId] = _tokenURI;
//     }

//     /**
//      * @dev See {ERC721-_burn}. This override additionally checks to see if a
//      * token-specific URI was set for the token, and if so, it deletes the token URI from
//      * the storage mapping.
//      */
//     function _burn(uint256 tokenId) internal virtual override {
//         super._burn(tokenId);

//         if (bytes(_tokenURIs[tokenId]).length != 0) {
//             delete _tokenURIs[tokenId];
//         }
//     }
// }

contract JapanPrefectureNft is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // TODO: 調べる Visibility for constructor is ignored. If you want the contract to be non-deployable, making it "abstract" is sufficient.
    constructor() ERC721("JapanPrefectureNft", "TestNFT") {
        
    }

    function mintNFT(address recipient, string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
    
    function balanceOf(address _owner) external view returns (uint256) 
    {
        return 0;
    }
    function ownerOf(uint256 _tokenId) external view returns (address) {
        //
        return msg.sender;
    }
}



