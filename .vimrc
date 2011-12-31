

"----------------------------------------------------------
" �����R�[�h�̎w��
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,utf-8,euc-jp,cp932
"----------------------------------------------------------





"----------------------------------------------------------
""""""C-@��C-[�ɒu��������i�딚�h�~�j

  imap <C-@> <C-[>




"----------------------------------------------------------
"""""""quickrun�ݒ�

let g:quickrun_config["_"] = {
    \  "runner/vimproc/updatetime" : 100,
    \ "split": "{'rightbelow 8sp'}"
\ }

"""""""" ���s
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
"""""""textutil�ݒ�
let g:textutil_txt_encoding='utf-8'





"----------------------------------------------------------
""""""open-browser.vim�ݒ�

  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)






"----------------------------------------------------------
""""""vimplenote.vim�ݒ�

let g:VimplenoteUsername = "aki@novotempo.info"
let g:VimplenotePassword = "bukemunote"




"----------------------------------------------------------
""""""twitvim
let tiwtvim_count = 100




"----------------------------------------------------------
"""""""neocomplcache�ݒ�
let g:neocomplcache_enable_at_startup =1
let g:neocomplcache_snippets_dir='~/.vim/snippets'
imap <C-k> <Plug>(neocomplcache_snippets_expand)

smap <C-K> <Plug>(neocomplcache_snippets_expand)







"----------------------------------------------------------
"""""""Esc�̓�񉟂��Ō����Ȃǂ̃n�C���C�g����

nmap <ESC><ESC> ;nohlsearch<CR><ESC>




"----------------------------------------------------------
""""""""dicwin�����iCtrl-K�����Ȃ�����ׁj
let plugin_dicwin_disable    = 1



"----------------------------------------------------------
"""""""���ʎ����⊮
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
"""""""���{����͎����I���E�I�t"
set noimdisableactivate




"----------------------------------------------------------
"""""""�J�[�\����\���s�ňړ�����B�����s�ړ���<C-n><C-p>"
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk





"----------------------------------------------------------
""" Unite.vim
" �N�����ɃC���T�[�g���[�h�ŊJ�n
let g:unite_enable_start_insert = 1

" �C���T�[�g�^�m�[�}���ǂ��炩��ł��Ăяo����悤�ɃL�[�}�b�v
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

" �o�b�t�@�ꗗ
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" �t�@�C���ꗗ
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=file_rec file_rec<CR>
" ���W�X�^�ꗗ
nnoremap <silent> ,uy :<C-u>Unite -buffer-name=register register<CR>
" �ŋߎg�p�����t�@�C���ꗗ
nnoremap <silent> ,ur :<C-u>Unite file_mru<CR>

nnoremap <silent> <C-k> :<C-u>Unite file_mru<CR>
""nnoremap <silent> <C-k> :<c-u>unite file_mru<cr>
" �S���悹
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" unite.vim��ł̃L�[�}�b�s���O
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " �P��P�ʂ���p�X�P�ʂō폜����悤�ɕύX
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESC�L�[��2�񉟂��ƏI������
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction




"----------------------------------------------------------
""""""vimfiler���f�t�H���g�u���E�U�ɕύX
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
