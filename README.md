# awesome-1st-contract

## やりたいこと

- 「都道府県NFT」を作り出すスマートコントラクトを開発する
  - ダミーの「都道府県画像」を関連付けたNFTアート
    - 都道府県画像は以下の東京都の画像とする
      - ![img(./img/tokyo.png)]

- スマートコントラクトはイーサリアムのERC721に準拠する
  - [ERC-721 NON-FUNGIBLE TOKEN STANDARD](https://eips.ethereum.org/EIPS/eip-721)

## 設計

- ERC721に準拠した場合に設計・実装が必要な関数
  - name関数, symbol関数, tokenURI関数は、ERC721で「metadata extension」として任意実装の扱い(OPTIONAL)とされているが,ここでは設計・実装の対象とする

|コントラクト|関数|説明|
|:-------:|:-------:|:-------:|
|JapanPrefectureNft|balanceOf|指定したアドレス（オーナー）が所有するNFTの数を返す|
||ownerOf|指定したトークン(NFT)のオーナーのアドレスを返す|
||safeTransferFrom|トークン(NFT)をfrom->toに安全に転送する|
||transferFrom|トークン(NFT)をfrom->toに転送する|
||approve|_approvedアドレスのユーザへのトークン_tokenIdの受け渡しを承認する|
||setApprovalForAll|_operatorアドレスをもつアカウントに全てのアセット管理を許可する|
||getApproved|トークン_tokenIdの承認済みイーサリアムアドレスを返却する|
||isApprovedForAll|オーナー_ownerから_operatorアドレスを持つユーザを承認済か否かを確認する|
||name|このスマートコントラクトが定義するNFTの名前を返却する(シンプルでわかりやすい名前を返却する)|
||symbol|このスマートコントラクトが定義するNFTのティッカーシンボルを返却する|
||tokenURI|指定したトークン(NFT)のURIを返却する（URIは個別のトークン(NFT)ごとに異なる値が割り当てられることが必須）|

- ERC721が定義する以下のイベントも、規格に準拠して、それぞれ対応する関数内で規格に準拠した適切なタイミングで呼び出す。
  - Transfer
      - `event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);`
      - emits when NFTs are created (`from` == 0) and destroyed (`to` == 0). Exception: during contract creation, any number of NFTs may be created and assigned without emitting Transfer. At the time of any transfer, the approved address for that NFT (if any) is reset to none.

  - Approval
      - `event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);`
      - emits when the approved address for an NFT is changed or reaffirmed.
          - The zero address indicates there is no approved address.　When a Transfer event emits, this also indicates that the approved address for that NFT (if any) is reset to none.

  - ApprovalForAll
      - `event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);`
      - emits when an operator is enabled or disabled for an owner.
          - The operator can manage all NFTs of the owner.

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
    - [ERC-721 NON-FUNGIBLE TOKEN STANDARD](https://eips.ethereum.org/EIPS/eip-721)
      - function
          - balanceOf オーナーの残高を確認する Count all NFTs assigned to an owner
              - `function balanceOf(address _owner) external view returns (uint256);`
          - ownerOf トークンのオーナーのイーサリアムアドレスを確認する - Find the owner of an NFT
              - `function ownerOf(uint256 _tokenId) external view returns (address);`
          - safeTransferFrom トークンをfrom->toに安全に転送する(dataペイロード付き) - Transfers the ownership of an NFT from one address to another address
              - function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable;
          - safeTransferFrom トークンをfrom->toに安全に転送する Transfers the ownership of an NFT from one address to another address
              - function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;
          - transferFrom トークンをfrom->toに転送する Transfer ownership of an NFT 
              - function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
          - approve _approvedアドレスのユーザへのトークン_tokenIdの受け渡しを承認する Change or reaffirm the approved address for an NFT
              - function approve(address _approved, uint256 _tokenId) external payable;
          - setApprovalForAll _operatorアドレスをもつアカウントに全てのアセット管理を許可する(もしくは禁止する)へのトークン受け渡しを無条件で承認/否認する / Enable or disable approval for a third party ("operator") to manage all of `msg.sender`'s assets
            - thrid party operator とは?
              - コントラクトアカウントのイーサリアムアドレス
          - getApproved トークン_tokenIdの承認済みイーサリアムアドレスを返却する
              - `function getApproved(uint256 _tokenId) external view returns (address);`
          - isApprovedForAll オーナー_ownerから_operatorアドレスを持つユーザを承認済か否かを確認する
              - `function isApprovedForAll(address _owner, address _operator) external view returns (bool);`
          - transferFrom トークンをfrom->toに転送する
              - `function transferFrom(address _from, address _to, uint256 _tokenId) external payable;`
          - approve _approvedアドレスのユーザへのトークン_tokenIdの受け渡しを承認する
              - `function approve(address _approved, uint256 _tokenId) external payable;`
                - Approves another address to transfer the given token ID
                - There can only be one approved address per token at a given time. 
                - Can only be called by the token owner or an approved operator.
      - function(metadata extension, OPTIONAL for ERC-721 smart contracts)
          - name 
              - `function name() external view returns (string _name)`
                  - A descriptive name for a collection of NFTs in this contract
          - symbol
              - `function symbol() external view returns (string _symbol)`
                  - An abbreviated name for NFTs in this contract
          - tokenURI
              - `function tokenURI(uint256 _tokenId) external view returns (string)`
                  - A distinct Uniform Resource Identifier (URI) for a given asset.
      - event
          - Transfer
              - `event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);`
              - emits when NFTs are created (`from` == 0) and destroyed (`to` == 0). Exception: during contract creation, any number of NFTs may be created and assigned without emitting Transfer. At the time of any transfer, the approved address for that NFT (if any) is reset to none.

          - Approval
              - `event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);`
              - emits when the approved address for an NFT is changed or reaffirmed.
                  - The zero address indicates there is no approved address.　When a Transfer event emits, this also indicates that the approved address for that NFT (if any) is reset to none.

          - ApprovalForAll
              - `event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);`
              - emits when an operator is enabled or disabled for an owner.
                  - The operator can manage all NFTs of the owner.
    - @openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol
      - abstract contract vs interface
        - [abstract contracts](https://docs.soliditylang.org/en/v0.8.15/contracts.html#abstract-contracts)
          - at least one of their functions is not implemented or when they do not provide arguments for all of their base contract constructors
        - [interfaces](https://docs.soliditylang.org/en/v0.8.15/contracts.html#interfaces)
          - cannot have any functions implemented. There are further restrictions

## 課題

- ERC721で実際どう実装すればいいのか、いまいち整理がついてない。

  - safeTransferFromとtransferFromの違い
  　- OpenZeppelinのコードを読んだ
      - safeTransferFromの方は
        - 転送先がコントラクト、かつ、トークンIERC721Receverインターフェースを実装してるコントラクトの場合
          - トークンの転送を受理するか検査できる（拒否することもできる）
            - onERC721Receivedという関数を実装し、トークン転送を受理するか検査
              - この関数は、「function selector」を返す必要があるという仕様
                - [function selectorとは](https://ethereum.stackexchange.com/questions/72363/what-is-a-function-selector)
                - [function selectorとは2](https://y-nakajo.hatenablog.com/entry/2018/09/16/154612#Function-Selector)
                  - function selector allows you to perform dynamic invocation of a function
                  - 外部から関数を呼び出すときに、関数の実態を探し出し実行する処理のこと
                  - Function Selectorはコンパイル後に生成されるopcodesの先頭に近い位置に配置されます
                  - 関数呼び出し時のコールデータの最初の4バイトは呼び出す関数を指定しています。関数シグネチャにおけるKeccak-256(SHA-3)ハッシュの最初の4バイト(左から4バイトでビッグ・エンディアンの順序になっています)のことです
                    - [solidity calldataとは](https://ethereum.stackexchange.com/questions/52989/what-is-calldata)
                      - 関数の外部呼び出し、データがどこにストアされるか
                        - Functions can be called internally, e.g. from within the contract, or externally. When a function's visibility is external, only external contracts can call that function.
                          - When such an external call happens, the data of that call is stored in calldata.
                      - read-only byte-addressable space アドレシング可能
                        - 読み取り専用のバイトアドレシング可能空間
                    - based on the name of the function and the type of each one of the input arguments.
      - The ERC721 smart contract calls this function on the recipient after a IERC721.safeTransferFrom. 
      , otherwise the caller will revert the transaction. The selector to be returned can be obtained as this.onERC721Received.selector. This function MAY throw to revert and reject the transfer. Note: the ERC721 contract address is always the message sender.

  - approveとsetApprovalForAllの違い
    - 「setApprovalForAllにより譲渡の許可がされているのであれば」「マーケットコントラクト上で煩わしいapproveは不要」という関係があると、Qiitaで説明を見かけたが、これは本当か?
      - https://qiita.com/rmanzoku/items/a90f265ae499dc21b9cb
    - ERC721の記載では、「approve」関数を実行するために「isApprovedForAll」による委譲をうけているオペレータであるかオーナーであることが必要という前提の記載があった
      - しかし、setApprovalForAllで許可がされていれば、approveが必要ないというルールは正しいのか?

- とりあえず、サンプルに沿って「mintNFT」関数を実装した。これでNFTの発行ができそうだが、他にどのようなイベントが必要？
  - この辺、自由に実装するやつか?

- そもそもスマートコントラクトを作成したとき、NFTのトークンはどこにどんな状態であるの？それはだれがきめるのか。ERC721がきめるのか?
  - スマートコントラクトを作成したとき 
    - NFTが存在している / NFTが存在していない
      - NFTが存在している場合
        - そのNFTは、ブロックチェーン上に保持されているのか / ブロックチェーン上に保持されていない
          - 保持している場合
            - だれが所有しているのか
      - NFTが存在していない場合
        - いつ、NFTは作成されるのか
          - 作成とは、鋳造のことか？
        - 無限に作成できるのか?
          - 無限ではない場合
            - 誰がどのように制限するのか?
