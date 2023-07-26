# Node Manager Check

## Overview

node.jsのバージョン管理ツールを環境に合わせて使い分けられるようにする。
パッケージは下記の条件で使い分ける。

- package.jsonがワーキングディレクトリにあり、voltaの設定が書かれている
  - voltaを有効にする
- .nvmrcがワーキングディレクトリにある
  - nvmを有効にする
- それ以外
  - voltaまたはnvmを選択できるようにする

## インストール手順

### node-manager-checkをインストール

下記コマンドで、node-manager-checkをインストールする

```rust
$ cargo install
```

### setupNodeManager.shのセットアップ

※ zshを前提で書いているが、bashでも同じ流れで使えると思います。

まず、下記のコマンドでsetupNodeManager.shをコピーしてください

```zsh
$ mkdir -p ${HOME}/.zsh
$ cp setupNodeManager.sh ${HOME}/.zsh/
```

次に、`.zshrc`を編集して、下記を追記してください

```zsh

...

. ${HOME}/.zsh/setupNodeManager.sh
```
