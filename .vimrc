"Some nice basic settings
filetype on
filetype indent plugin on
set encoding=utf-8
colo mine
set nu
set relativenumber
set wildmenu
set tabstop=2
set shiftwidth=2
set autoindent
set cindent
"set smartindent
set visualbell
set guioptions-=T
set guioptions-=m
set completeopt=longest,menuone
set showcmd
syntax on
nnoremap <Space> :
nnoremap <C-i> i<C-t><Esc>

"Folding configuration
setl foldmethod=indent
let &l:foldlevel = 1
nnoremap z za
nnoremap Z zA
set foldignore=\"\"\"

"Autodetect filetype.
augroup vimrc_filetype
	autocmd!
	autocmd FileType c call s:Cfile()
	autocmd FileType html call s:Htmlfile()
	autocmd FileType python call s:Pyfile()
	autocmd FileType plaintex call s:Texfile()
	autocmd FileType tex call s:Texfile()
	autocmd FileType vim call s:Vimrc()
augroup end
"Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

function! s:Cfile()
	map <silent> <C-c> :s/^/\/\//<CR>:noh<CR>
	map <silent> <C-u> :s/^\s*\/\///<CR>:noh<CR>
"	inoremap ;mptr <Esc>:r $HOME/.vim/matrix_ptr.c<CR>
"				\wa
	set cindent
	"	Only activate this section if there is a batch script to compile C called
	"	'compile'
"	nnoremap <buffer> <F5> :w<CR>:!clear<CR>:exec '!compile' shellescape(@%, 1)<CR>
"				\:exec '!%:r.exe'<CR>
endfunction

function! s:Htmlfile()
	vmap <silent> <C-c> :s/^/<!--/<CR>:'<,'>s/$/-->/<CR>:noh<CR>
	vmap <silent> <C-u> :s/^\s*<!--//<CR>:'<,'>s/-->$//<CR>:noh<CR>
"	nnoremap \skeleton :-1r $HOME/.vim/skeleton.html<CR>
"				\6jo
	inoremap <expr> <CR> pumvisible() ? "\<C-y>\>\<\/\<C-x>\<C-o>\<Esc>2ba" : "\<C-g>u\<CR>"
"	inoremap <expr> <Tab> pumvisible() ? "\<C-y>\>\<\/\<C-x>\<C-o>\<Esc>2ba" : "\<C-g>u\<CR>"
	inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
				\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
	inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
				\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
	inoremap < <<C-x><C-o><C-n>
endfunction

function! s:Pyfile()
"Autoimport Matplotlib.pyplot, numpy and scipy.stats.
	command Statpy :normal! i <BS>
				\import numpy as np<CR>
				\import matplotlib.pyplot as plt<CR>
				\from scipy import stats<ESC>

"Save and execute Python script from inside vim using F5.
	nnoremap <buffer> <F5> :w<CR>:!clear<CR>:exec '!python3' shellescape(@%, 1)<CR>
	map <silent> <C-c> :s/^/\#/<CR>:noh<CR>
	map <silent> <C-u> :s/^\s*\#//<CR>:noh<CR>
"	inoremap ;docstr """<CR><BS>"""<CR><BS><++><Esc>2ka
	inoremap ;docstr """<CR>"""<CR><++><Esc>2ka
	inoremap ;> >>><Tab>

"PEP-8 Settings
	set tabstop=4
	set softtabstop=4
	set expandtab
	set shiftwidth=4
	set textwidth=79
	set fileformat=unix
endfunction

function! s:Texfile()
"	nnoremap \itemize :r $HOME/.vim/itemize.tex<CR>
"				\j$a<Space>
"	nnoremap \equation :r $HOME/.vim/equation.tex<CR>
"				\ja
"	nnoremap \figure :r $HOME/.vim/figure.tex<CR>
"				\2ja
"	nnoremap \table :r $HOME/.vim/table.tex<CR>
"				\4j$i
"	nnoremap \packages :-1r $HOME/.vim/packages.tex<CR>
"				\/end{document}<CR>:noh<CR>O
"Compile .tex file using <F5> and open with <F6> in Windows.
"Uncomment command below it,to use it in Linux.
"	nnoremap <buffer> <F5> :w<CR>:!start /b pdflatex -shell-escape %<CR>
"	nnoremap <buffer> <F6> :silent !start "%:r.pdf"<CR>
"	nnoremap <buffer> <F5> :w<CR>:silent !pdflatex -shell-escape %<CR><CR>
"	nnoremap <buffer> <F6> :%:r.pdf & disown<CR><CR>

"Commenting in a .tex file.
	map <silent> <C-c> :s/^/\%/<CR>:noh<CR>
	map <silent> <C-u> :s/^\s*%//<CR>:noh<CR>
	inoremap $ $$<Space><++><Esc>5hi
	inoremap $$ $
	inoremap ;qq \glqq\grqq{}<Esc>3bi<Space>
	inoremap ;begin \begin{<CR><BS>\end{<Esc><C-v>$kA
endfunction

function! s:Vimrc()
	map <silent> <C-c> :s/^/\"/<CR>:noh<CR>
	map <silent> <C-u> :s/^\s*\"//<CR>:noh<CR>
	inoremap < <><Space><++><Esc>5hi
	inoremap << <
	inoremap <> <>
endfunction

"Automatically make closing brackets/quote.
"Double tap if not wanted
inoremap { {}<Space><++><Esc>5hi
inoremap {<CR> {<CR>}<CR><CR><++><Esc>2kO
inoremap {{ {
inoremap {} {}
inoremap ( ()<Space><++><Esc>5hi
inoremap (<CR> (<CR>)<CR><CR><++><Esc>2kO
inoremap (( (
inoremap () ()
inoremap [ []<Space><++><Esc>5hi
inoremap [<CR> [<CR>]<CR><CR><++><Esc>2kO
inoremap [[ [
inoremap [] []
inoremap " ""<Space><++><Esc>5hi
inoremap "" "
inoremap ' ''<Space><++><Esc>5hi
inoremap '' '

"Jump to <++>. use ";tag" to quickly make this tag.
inoremap <Space><Space> <Esc>/<++><CR>:noh<CR>"_c4l
inoremap ;tag <++><Esc>

"Better key bindings to navigate/resize splitscreens.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap < <C-w><
nnoremap > <C-w>>
