filetype off												" 一旦ファイルタイプ関連を無効化する
set scrolloff=5												" スクロールするときに下が見えるようにする
syntax enable												" 構文チェック
set backspace=indent,eol,start								" delete で各種消せるようにする
set vb t_vb=												" ビープ音を消す
set novisualbell											" ビジュアルベルの無効化
set clipboard+=unnamed										" OS のクリップボードを使う
set ambiwidth=double
set list													" 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%	" 不可視文字の出力方法を変更
set number 													" 行番号を表示
set cursorline 												" 行を強調表示
set ruler 													" 右下に表示される行・列の番号を表示する
set nostartofline											" 移動コマンドを使ったときに、行頭に移動しない
set matchpairs& matchpairs+=<:>								" 対応括弧に<と>のペアを追加
set showmatch												" 対応括弧のハイライトを表示する
set matchtime=3												" 対応括弧の表示秒数を3 秒にする
set wrap 													" ウインドウの幅が長い行は折り返す
set textwidth=0												" 入力されているテキストの最大幅を無効にする
set shiftround												" インデントをshiftwidthの倍数に丸める
set infercase												" 補完の際の大文字小文字の区別しない
set hidden													" 変更中のファイルでも、保存しないで他のファイルを表示
set switchbuf=useopen										" 新しく開く代わりにすでに開いてあるバッファを開く
set tabstop=4												" タブ文字幅
set shiftwidth=4											" 自動インデントの幅
"set expandtab												" タブ入力を複数の空白入力に置き換え
set smarttab												" 行頭の余白内で Tab を打ち込むとshiftwidthの数だけインデントする
set smartindent												" autoindentと同様だがC構文を認識
set notitle													" タイトルをウィンドウ枠に表示
set showtabline=2											" タブバーを常に表示
set undolevels=300											" Undo/Redo を300回保存する
set history=10000											" コマンド・検索パターンの履歴

" IME設定
set iminsert=0												" 挿入モード時にIMEをデフォルトオフにする
set imsearch=-1												" 検索モード時にIMEをデフォルトオンにする

set laststatus=2											" ステータスライン
set cmdheight=2												" メッセージ表示欄
set gdefault												" 置換の時 g オプションをデフォルトで有効にする
set ruler													" カーソルが何行目の何列目に置かれているかを表示する

" タブ補完
set wildmenu												" コマンドラインモードの文字入力時に補完機能をオンにする
set wildmode=list:longest									" マッチするものをリスト表示しるる、共通する最長の部分まで保管

set pastetoggle=<F12>										" ペースト
set timeoutlen=10											" ESCキーが押されてからの待ち時間
set mouse=a													" マウス対応
set showcmd													" コマンドを画面最下部に表示する

" 自動生成されるメタファイルの設定
set backup
set backupdir=~/.vim/temp
set backupext=.back
set swapfile
set directory=~/.vim/temp
set undofile
set undodir=~/.vim/temp
set viminfo+=n~/.vim/temp/.viminfo

set autoread												" 編集中のファイルが変更されたら自動で読み直す
set wildmenu wildmode=list:full  							"onにするとvimからファイルを開くときにリストを表示する

" 自動コメントアウトの無効
augroup auto_comment_off
	autocmd!
	autocmd BufEnter * setlocal formatoptions-=r
	autocmd BufEnter * setlocal formatoptions-=o
augroup END
