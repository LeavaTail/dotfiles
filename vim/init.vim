" Vim設定ファイルを格納するディレクトリ
let g:runtimedir = expand('~/.vim')

" rcファイルの読み込み
function! s:source_rc(rc_file_name)
	let rc_file = expand(g:runtimedir . '/rc/'  . a:rc_file_name)
	if filereadable(rc_file)
		execute 'source' rc_file
	endif
endfunction

" プラグインマネージャdeinの構築
call s:source_rc('dein.rc.vim')
" エンコーディング
call s:source_rc('encoding.rc.vim')
" Vimの初期環境設定
call s:source_rc('init.rc.vim')
" メタファイル
call s:source_rc('metafile.rc.vim')
" キーボードやマウス関連の設定
call s:source_rc('io.rc.vim')
" キーマッピングの環境構築
call s:source_rc('mapping.rc.vim')
" 検索モード時の環境構築
call s:source_rc('search.rc.vim')
