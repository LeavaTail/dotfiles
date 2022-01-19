# dotfiles

![Version](https://img.shields.io/github/tag/LeavaTail/dotfiles.svg)
![CI](https://github.com/LeavaTail/dotfiles/workflows/CI/badge.svg)

Linux用の設定ファイル群

## Description

![demo](https://github.com/LeavaTail/dotfiles/blob/images/vim20220119.png)

このリポジトリには、以下の設定ファイルが保存されています。

* zsh
* tmux
* vim
* byobu
* tig

## Requirements

* git
* make
* vim (>=8.0)
* zsh (>=4.3.11)
* tmux (>=1.9)
* Byobu
* nodejs (>=12.12)

## Start-Up

下記のコマンドを実行するだけでデプロイが完了します。

```shell
user@hostname:${WORK}/dotfiles$ make install
```

## Clean-up

デプロイした設定ファイルを削除するには、以下のコマンドを実行する必要があります。

```shell
user@hostname:${WORK}/dotfiles$ make uninstall
```

## Commands

`make deploy`

設定ファイルをデプロイする

`make list`

リンクされるドットファイルをリストする

`make init`

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

該当するドットファイルに関連するすべてのファイルを削除する

`make pretest`

ドットファイルが正常に展開されたか検証する

`make test`

ドットファイルが正常に展開され、期待した動作をするかどうか検証する

`make help`

ターゲットの詳細説明を表示する

## Usage

それぞれの設定ファイルについて説明します。

## Overall

dotfilesプロジェクトの全体像を下記に示す。
![demo](https://github.com/LeavaTail/dotfiles/blob/images/overall20220119.png)

この設定ファイルは、zsh環境に[zprezto](https://github.com/sorin-ionescu/prezto)フレームワーク、Vim環境に[dein](https://github.com/Shougo/dein.vim)プラグインマネージャを別途使用している。
そのため、本dotfilesのインストール手順は2つのフェーズ(`deploy`と`init`)に分割している。

1. `make deploy`を実行すると、各設定ファイルに対してシンボリックリンクを作成する
2. `make init`を実行すると、zpreztoをGitHubからクローンし、独自のパッチを当てる

新規にインストールするプラグインは以下の通り。

### vim

* [dein](https://github.com/Shougo/dein.vim)
* [vimproc](https://github.com/Shougo/vimproc.vim)
* [vim-horizon](https://github.com/ntk148v/vim-horizon)
* [vim-easymotion](github.com/easymotion/vim-easymotion)
* [vim-devicons](https://github.com/ryanoasis/vim-devicons)
* [coc](https://github.com/neoclide/coc.nvim)
* [fzf](https://github.com/junegunn/fzf.vim)
* [gtags](https://github.com/vim-scripts/gtags.vim)
* [gen_tags](https://github.com/jsfaint/gen_tags.vim)
* [vim-signature](https://github.com/kshenoy/vim-signature)
* [vim-quickhl](https://github.com/t9md/vim-quickhl)
* [vim-localrc](https://github.com/thinca/vim-localrc)
* [lightline](https://github.com/itchyny/lightline.vim)
* [vim-toml](https://github.com/cespare/vim-toml)

また、zshは下記のバージョンのzpreztoをベースとしている。

* [zprezto](https://github.com/sorin-ionescu/prezto/commit/166cbe2fca25319db2551f0cc74a86c93259017d)

## Troubleshooting

**Q1.** Vimで「`node is not executable`」とエラーメッセージが出る

nodejsのバージョンが古い可能性があります。

公式手順を参考に最新のnodefsをインストールしてみてください。

```shell
user@hostname:${WORK}/dotfiles$ curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
```

**Q2.** Tigで「`Failed run the diff-highlight problem: diff-highlight`」とエラーメッセージが出る

diff-highlightへのパスが通っていない可能背があります。

## Authors

[LeavaTail](https://github.com/LeavaTail)
