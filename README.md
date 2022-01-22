# dotfiles

![Version](https://img.shields.io/github/tag/LeavaTail/dotfiles.svg)
![CI](https://github.com/LeavaTail/dotfiles/workflows/CI/badge.svg)

Linux用の設定ファイル群  
デフォルトの場合には、次のソフトウェアの設定ファイルが展開されます。

* zsh
* tmux
* Vim (Neovim)
* tig

![demo](https://github.com/LeavaTail/dotfiles/blob/images/vim20220119.png)

## System Requirements

次のソフトウェアバージョンにて動作することを確認しています。

* Ubuntu Base 18.04
* Ubuntu Base 20.04

## Requirements

スクリプトを用いて自動デプロイをする場合、次のソフトウェアが必要になります。

* git
* make
* Neovim
* zsh (>=4.3.11)
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

dotfilesのトップディレクトリに次のようなMakeターゲットを用意している。

* `make deploy`: 設定ファイルをデプロイする
* `make list`: リンクされるドットファイルをリストする
* `make init`: 各種アプリケーションの設定ファイル以外の環境設定などを実施する
* `make check`: デプロイに必要なパッケージが揃っているかどうかを確認する
* `make install`: 設定ファイルをデプロイし、各種アプリケーションの初期設定を実施する
* `make update`: 設定ファイルをリモートの最新リポジトリの状態に更新する
* `make uninstall`: デプロイされたドットファイルのみ削除する
* `make clean`: 該当するドットファイルに関連するすべてのファイルを削除する
* `make pretest`: ドットファイルが正常に展開されたか検証する
* `make test`: ドットファイルが正常に展開され、期待した動作をするかどうか検証する
* `make help`: ターゲットの詳細説明を表示する

## Usage

それぞれの設定ファイルについて説明します。

### vim

次のキーバインドが追加されています。

| Mode | Key | Description |
| :--- | :-- | :---------- |
| NORMAL | `s` | easymotion: 2-key find Motion |
| NORMAL | `g/` | easymotion: N-key find Motion |
| VISUAL | `s` | easymotion: 2-key find Motion |
| VISUAL | `g/` | easymotion: N-key find Motion |
| Operator Pending | `s` | easymotion: 2-key find Motion |
| Operator Pending | `g/` | easymotion: N-key find Motion |
| - | `\j` | easymotion: Line motions |
| - | `\k` | easymotion: Line motions |

## Design

dotfilesプロジェクトの全体像を下記に示す。
![demo](https://github.com/LeavaTail/dotfiles/blob/images/overall20220119.png)

この設定ファイルは、zsh環境に[zprezto](https://github.com/sorin-ionescu/prezto)フレームワーク、Vim環境に[dein](https://github.com/Shougo/dein.vim)プラグインマネージャを別途使用している。
そのため、本dotfilesのインストール手順は2つのフェーズ(`deploy`と`init`)に分割している。

1. `make deploy`を実行すると、各設定ファイルに対してシンボリックリンクを作成する
2. `make init`を実行すると、zpreztoをGitHubからクローンし、独自のパッチを当てる

Vimは、次のプラグインを新規にインストールする。

* [dein](https://github.com/Shougo/dein.vim)
* [vimproc](https://github.com/Shougo/vimproc.vim)
* [vim-horizon](https://github.com/ntk148v/vim-horizon)
* [vim-easymotion](github.com/easymotion/vim-easymotion)
* [vim-devicons](https://github.com/ryanoasis/vim-devicons)
* [coc](https://github.com/neoclide/coc.nvim)
* [fzf](https://github.com/junegunn/fzf.vim)
* [gtags](https://github.com/vim-scripts/gtags.vim)
* [vim-signature](https://github.com/kshenoy/vim-signature)
* [lightline](https://github.com/itchyny/lightline.vim)
* [vim-toml](https://github.com/cespare/vim-toml)

zshは、下記のバージョンのzpreztoを利用する。

* [zprezto](https://github.com/sorin-ionescu/prezto/commit/166cbe2fca25319db2551f0cc74a86c93259017d)

## Troubleshooting

**Q1.** Vimで「`node is not executable`」とエラーメッセージが出る

nodejsのバージョンが古い可能性があります。

公式手順を参考に最新のnodefsをインストールしてみてください。

```shell
user@hostname:${WORK}/dotfiles$ curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
```

**Q2.** Tigで「`Failed run the diff-highlight problem: diff-highlight`」とエラーメッセージが出る

diff-highlightへのパスが通っていない可能性があります。

## Authors

[LeavaTail](https://github.com/LeavaTail)
