" カーソル移動を行内でも動けるように
nnoremap <Down> gj
nnoremap <Up> gk
"<ESC>hでハイライトをOFFにする
nnoremap <ESC><ESC> :noh<CR>
" == で自動インデント
nnoremap == gg=G''
" Space を付けるとシステムのクリップボードを用いる
vmap <Space>y "+y
vmap <Space>d "+d
nmap <Space>p "+p
nmap <Space>P "+P
vmap <Space>p "+p
vmap <Space>P "+P
