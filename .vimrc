

"----------------------------------------------------------
" 文字コードの指定
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,utf-8,euc-jp,cp932
"----------------------------------------------------------





"----------------------------------------------------------
""""""C-@をC-[に置き換える（誤爆防止）

  imap <C-@> <C-[>




"----------------------------------------------------------
"""""""quickrun設定

let g:quickrun_config["_"] = {
    \  "runner/vimproc/updatetime" : 100,
    \ "split": "{'rightbelow 8sp'}"
\ }

"""""""" 実行
let g:quickrun_config["run/vimproc"] = {
    \ "exec": "%s:p:r %a",
    \ "output_encode" : "utf-8",
    \ "runner" : "vimproc",
    \ "outputter" : "buffer"
\ }
silent! nmap <unique>r<Plug>(quickrun)




"----------------------------------------------------------
""""""pathogen
call pathogen#infect()



""""""neobundle.vim
set nocompatible
filetype plugin indent off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.bundle'))
endif



NeoBundle "https://github.com/Shougo/vimfiler.git"
NeoBundle "https://github.com/Shougo/unite.vim.git"
"NeoBundle "https://github.com/thinca/vim-quickrun.git"
"NeoBundle "https://github.com/scrooloose/nerdcommenter.git"
NeoBundle "https://github.com/Shougo/vimshell.git"
"NeoBundle "http://github.com/Shougo/vimproc"
NeoBundle "https://github.com/Shougo/vimproc.git"

NeoBundle "https://github.com/Shougo/neocomplcache.git"
"NeoBundle "git://github.com/davidoc/taskpaper.vim.git"
"NeoBundle "https://github.com/mattn/vimplenote-vim.git"
"NeoBundle "https://github.com/mattn/webapi-vim.git"
"NeoBundle "https://github.com/Shougo/echodoc.git"
"NeoBundle "https://github.com/vim-scripts/TwitVim.git"
""NeoBundle "https://github.com/tsukkee/unite-help.git"

""NeoBundle "https://github.com/choplin/unite-vim_hacks.git"

"NeoBundle "https://github.com/vim-scripts/open-browser.vim.git"
"NeoBundle "https://github.com/sbl/scvim.git"

"NeoBundle "https://github.com/vim-scripts/textutil.vim.git"

""Bundle "https://github.com/vim-scripts/scvim.git"

""NeoBundle "https://github.com/fuenor/qfixhowm.git"
""NeoBundle "https://github.com/ujihisa/unite-colorscheme.git"
""NeoBundle "https://github.com/mattn/unite-advent_calendar.git"

""NeoBundle "https://github.com/vim-scripts/sudoku_game.git"


filetype plugin indent on




"----------------------------------------------------------
"""""""textutil設定
let g:textutil_txt_encoding='utf-8'





"----------------------------------------------------------
""""""open-browser.vim設定

  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)






"----------------------------------------------------------
""""""vimplenote.vim設定

let g:VimplenoteUsername = "aki@novotempo.info"
let g:VimplenotePassword = "bukemunote"




"----------------------------------------------------------
""""""twitvim
let tiwtvim_count = 100




"----------------------------------------------------------
"""""""neocomplcache設定
let g:neocomplcache_enable_at_startup =1
let g:neocomplcache_snippets_dir='~/.vim/snippets'
imap <C-k> <Plug>(neocomplcache_snippets_expand)

smap <C-K> <Plug>(neocomplcache_snippets_expand)







"----------------------------------------------------------
"""""""Escの二回押しで検索などのハイライト消去

nmap <ESC><ESC> ;nohlsearch<CR><ESC>




"----------------------------------------------------------
""""""""dicwin無効（Ctrl-Kが被らなくする為）
let plugin_dicwin_disable    = 1



"----------------------------------------------------------
"""""""括弧自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>




"----------------------------------------------------------
"""""""日本語入力自動オン・オフ"
set noimdisableactivate




"----------------------------------------------------------
"""""""カーソルを表示行で移動する。物理行移動は<C-n><C-p>"
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk





"----------------------------------------------------------
""" Unite.vim
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=file_rec file_rec<CR>
" レジスタ一覧
nnoremap <silent> ,uy :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,ur :<C-u>Unite file_mru<CR>

nnoremap <silent> <C-k> :<C-u>Unite file_mru<CR>
""nnoremap <silent> <C-k> :<c-u>unite file_mru<cr>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction




"----------------------------------------------------------
""""""vimfilerをデフォルトブラウザに変更
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
