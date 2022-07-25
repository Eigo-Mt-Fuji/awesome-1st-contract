
## これは何?

- The Mergeについて知りたい。エンジニアに取ってどういう影響がある？
  - この内容
    - https://ethereum.org/en/upgrades/merge/#preparing-for-the-merge

## 参考情報

- The Mergeについて知りたい。エンジニアに取ってどういう影響がある？を理解するために参照したページをおいておく
  - [Ethereum.org - The Merge](https://ethereum.org/en/upgrades/merge/#preparing-for-the-merge)
  - [Ethereum.org - Maximal Extractable Value](https://ethereum.org/en/developers/docs/mev/) ※MEVはブロック報酬とは別に得ることができる利益のこと
  - [20220630 - blog.ethereum.org - Sepolia Merge Announcement - Ethereum Foundation Blog](https://blog.ethereum.org/2022/06/30/sepolia-merge-announcement/)
  - [20211129 - blog.ethereum.org - How The Merge Impacts Ethereum’s Application Layer](https://blog.ethereum.org/2021/11/29/how-the-merge-impacts-app-layer/)

## いきなり結論

- 一般ユーザ、ステーキングノードオペレータ(バリデータノードオペレータ)、バリデータノード以外のノードオペレータ、dApp/スマートコントラクトのデベロッパーそれぞれ影響が違う
    - 一般ユーザ
        - You do not need to do anything to protect your funds entering The Merge. you should be on high alert for scams trying to take advantage of users during this transition
            - つまり、一般ユーザが、イーサリアム上の資産(ETHもしくはそれ以外のデジタルアセット)を保護するために、TheMergeに備えてやるべきことは特にない。敷いて言えば、詐欺に気をつける
    -  ステーキングノードオペレータ(バリデータノードオペレータ)
      - Key action
        - Run both a consensus layer client and an execution layer client
          - third-party endpoints to obtain execution data will be unavailable after The Merge.
        - Authenticate both execution layer and consensus layer clients with a shared JWT secret so they can securely communicate.
        - Set a fee recipient address to receive your earned transaction fee tips/MEV.
          - https://blog.chain.link/what-is-miner-extractable-value-mev/
    - バリデータノード以外のノードオペレータ
      - Key action
        - Install a consensus layer client in addition to an execution layer client
        - Authenticate execution and consensus clients with a shared JWT secret so they can securely communicate with one another.
    - dApp/スマートコントラクトのデベロッパー
      - Block structure
he Merge comes with changes to consensus, which also includes changes related to:
      - block structure
      - slot/block timing
      - opcode changes
        - renaming of the RANDOM opcode to PREVRANDO and JSON RPC specification changes

