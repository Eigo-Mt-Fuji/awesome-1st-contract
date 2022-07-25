# awesome-1st-contract

## パッケージインストール

```
npm install --save-dev hardhat
```

```
npm install @openzeppelin/contracts
```

## 拡張機能インストール

- JuanBlanco.solidity v0.0.139

## OpenZeppelin contract

- ERC721 NFT Token Standard
  - ERC721 token with storage based token URI management.
    - @openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol
      - abstract contract vs interface
        - [abstract contracts](https://docs.soliditylang.org/en/v0.8.15/contracts.html#abstract-contracts)
          - at least one of their functions is not implemented or when they do not provide arguments for all of their base contract constructors
        - [interfaces](https://docs.soliditylang.org/en/v0.8.15/contracts.html#interfaces)
          - cannot have any functions implemented. There are further restrictions
      - virtual override
      -                                                                                                                                                                                                                                               
@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol
@openzeppelin/contracts/token/ERC721/ERC721.sol
@openzeppelin/contracts/token/ERC721/IERC721.sol
@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol


@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol
@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol
@openzeppelin/contracts/token/ERC721/extensions/draft-ERC721Votes.sol
@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol
@openzeppelin/contracts/token/ERC721/extensions/ERC721Royalty.sol
@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol
@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol
@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol
@openzeppelin/contracts/interfaces/IERC721Enumerable.sol
@openzeppelin/contracts/interfaces/IERC721Metadata.sol
@openzeppelin/contracts/interfaces/IERC721Receiver.sol
@openzeppelin/contracts/interfaces/IERC721.sol


