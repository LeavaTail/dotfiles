# dotfiles

![Version](https://img.shields.io/github/tag/LeavaTail/dotfiles.svg)
![CI](https://github.com/LeavaTail/dotfiles/workflows/CI/badge.svg))]

Linux用の設定ファイル群

## Description
![demo](https://github.com/LeavaTail/dotfiles/blob/images/vim20191214.png)

このリポジトリには、以下の設定ファイルが保存されています。
  * zsh
  * tmux
  * emacs
  * vim
  * latexmk
  * screen
  * byobu

## Install
### Requirements
 * git
 * make
 * vim (>=8.0)
 * zsh (>=4.3.11)
 * tmux (>=1.9)
 * Byobu

最新の情報は下記を参照。
 * [common Required packages](docs/Requirements_common)
 * [about zsh Required packages](docs/Requirements_zsh)
 * [about vim Required packages](docs/Requirements_vim)
 * [about tmux Required packages](docs/Requirements_tmux)
 * [about byobu Required packages](docs/Requirements_byobu)

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


`make test`

ドットファイルが正常に展開されたか検証する


`make help`

ターゲットの詳細説明を表示する


## Usage
それぞれの設定ファイルについて説明します。

## Overall
dotfilesプロジェクトの全体像を下記に示す。
![demo](https://github.com/LeavaTail/dotfiles/blob/images/overall.png)

この設定ファイルは、zsh環境に[zprezto](https://github.com/sorin-ionescu/prezto)フレームワーク、Vim環境に[dein](https://github.com/Shougo/dein.vim)プラグインマネージャを別途使用している。

1. `make deploy`を実行すると、各環境に設定ファイルのシンボリックリンクを作成し、zprezto/tpm/deinをGitHubからクローンする。
2. `make init`を実行すると、deinで該当するVimプラグインをインストール、tpmで該当するtmuxプラグインをインストールする。

新規にインストールするプラグインは以下の通り。

**vim**
  * [dein](https://github.com/Shougo/dein.vim)
  * [vimproc](https://github.com/Shougo/vimproc.vim)
  * [onedark](https://github.com/joshdick/onedark.vim)
  * [vim-easymotion](github.com/easymotion/vim-easymotion)
  * [vim-devicons](https://github.com/ryanoasis/vim-devicons)
  * [ale](https://github.com/dense-analysis/ale)
  * [vim-gitgutter](github.com/airblade/vim-gitgutter)
  * [lightline](https://github.com/itchyny/lightline.vim)
  * [lightline-ale](https://github.com/maximbaz/lightline-ale)
  * [vim-signature](https://github.com/kshenoy/vim-signature)
  * [previm](https://github.com/previm/previm)
  * [open-browser](https://github.com/tyru/open-browser.vim)
  * [vim-localrc](https://github.com/thinca/vim-localrc)
  * [vim-quickhl](https://github.com/t9md/vim-quickhl)

## Authors
[LeavaTail](https://github.com/LeavaTail)
