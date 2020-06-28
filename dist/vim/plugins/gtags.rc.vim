let g:Gtags_Auto_Map = 0
let g:Gtags_OpenQuickfixWindow = 1

nmap <silent> K :<C-u>exe("Gtags ".expand('<cword>'))<CR>
nmap <silent> R :<C-u>exe("Gtags -r ".expand('<cword>'))<CR>
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <C-g> :Gtags
