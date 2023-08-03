# Node Manager Switcher

これはNode.jsのバージョン管理ツールを、シェル起動時に選択して使い分けることができるツールです。

また、シェル起動時のワーキングディレクトリにバージョン管理ツールの設定ファイルが存在する場合は、それを検知して自動でバージョン管理ツールをアクティベートします。

- package.jsonがワーキングディレクトリにあり、voltaの設定が書かれている
  - voltaを有効にする
- .nvmrcがワーキングディレクトリにある
  - nvmを有効にする
- それ以外
  - voltaまたはnvmを選択できるようにする

## インストール手順

### volta、nvmをインストール

各ツールのインストール手順に従って、volta、nvmをインストールをしてください。その後、`.zshrc`や`.bashrc`を編集して、下記のような記述を削除もしくはコメントアウトしてください。

※ インストール手順やバージョンによっは、コマンドが少し違うかもしれません。

**voltaの場合**

```bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
```

**nvmの場合**

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

### node-manager-checkをインストール

下記コマンドで、node-manager-checkをインストールする(※Rustの環境が必要です)

```bash
$ cargo install --path .
```

### setupNodeManager.shのセットアップ

※ zshを前提で書いてますが、bashでも同じ流れで使えると思います。

まず、下記のコマンドでsetupNodeManager.shをコピーしてください

```bash
$ mkdir -p ${HOME}/.zsh
$ cp setupNodeManager.sh ${HOME}/.zsh/
```

次に、`.zshrc`を編集して、下記を追記してください

```bash

...

. ${HOME}/.zsh/setupNodeManager.sh
```

> Notice
> 
> voltaやnvmのインストールディレクトリが違うなど、場合によっては正常に起動しない可能性もあります。
> その場合はsetupNodeManager.shを自前で編集して使ってください。
