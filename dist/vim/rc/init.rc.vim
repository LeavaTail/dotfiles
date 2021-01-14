" 5行余裕を持たせてスクロール
set scrolloff=5
" シンタックスハイライトを有効にする
syntax enable
" マルチバイト文字に対応
set ambiwidth=double
" 行番号を表示
set number
" 行を強調表示
set cursorline
" ページ送りで行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧のハイライトを表示する
set showmatch
" 対応括弧の表示秒数を3 秒にする
set matchtime=3	
" ウインドウの幅が長い行は折り返す
set wrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際の大文字小文字の区別しない
set infercase
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" タブ文字幅
set tabstop=4
" 自動インデントの幅
set shiftwidth=4
" 行頭の余白内で Tab を打ち込むとshiftwidthの数だけインデントする
set smarttab
" autoindentと同様だがCライクのインデント
set smartindent

" Undo/Redo を300回保存する
set undolevels=300
" コマンド・検索パターンの履歴
set history=10000

" エンコーディング
set encoding=UTF-8
scriptencoding UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

" 自動生成されるメタファイルの設定
set backup
set backupdir=~/.vim/temp
set backupext=.back
set swapfile
set directory=~/.vim/temp
set undofile
set undodir=~/.vim/temp
set viminfo+="n~/.vim/temp/.viminfo"
