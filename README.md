# dotfiles

![Version](https://img.shields.io/github/tag/LeavaTail/dotfiles.svg)

Linux用の設定ファイル群

## Description
![demo](https://github.com/LeavaTail/dotfiles/blob/images/vim20191202.png)

このリポジトリには、以下の設定ファイルが保存されています。
  * zsh
  * tmux
  * emacs
  * vim
  * tex
  * screen

## Install
### Requirements
Check below files.
 * [common Required packages](docs/Requirements_common)
 * [about zsh Required packages](docs/Requirements_zsh)
 * [about vim Required packages](docs/Requirements_vim)

### Install
下記のコマンドを実行するだけでデプロイが完了します。
```
$ make install
```

### Uninstall
デプロイした設定ファイルを削除するには、以下のコマンドを実行する必要があります。
```
 $ make uninstall
```

## Commands
`make deploy`

設定ファイルをデプロイする


`make list`

リンクされるドットファイルをリストする


`make init` **未実装**

各種アプリケーションの設定ファイル以外の環境設定などを実施する

`make check`

デプロイに必要なパッケージが揃っているかどうかを確認する

`make install`

設定ファイルをデプロイし、各種アプリケーションの初期設定を実施する


`make update`

設定ファイルをリモートの最新リポジトリの状態に更新する


`make uninstall`

デプロイされたドットファイルのみ削除する


`make clean`

該当するドットファイルをすべて削除する


`make test`

ドットファイルが正常に展開されたか検証する


`make help`

ターゲットの詳細説明を表示する


## Usage
それぞれの設定ファイルについて説明します。

## Authors
[LeavaTail](https://github.com/LeavaTail)
