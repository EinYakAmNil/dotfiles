"			  _
"__   _(_)_ __ ___  _ __ ___ 
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__ 
"  \_/ |_|_| |_| |_|_|  \___|
"
"<-->
"Some nice basic settings
set nocompatible
set incsearch
filetype on
filetype indent plugin on
set omnifunc=syntaxcomplete#Complete
set encoding=utf-8
colo yak
set nu
set relativenumber
set wildmenu
set scrolloff=8
set noshowmode
"set ruler
set tabstop=2
set shiftwidth=2
set autoindent
"set cindent
set smartindent
set visualbell
set guioptions-=T
set guioptions-=m
set completeopt=longest,menuone
set showcmd
set laststatus=2
syntax on
nnoremap <Space> :
vnoremap <Space> :
nnoremap <CR> /
nnoremap z zA
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <C-o>:echo "No down for you!"<CR>

"Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"Open urls in visual mode
"vnoremap <CR> <++>

"<-->
"Default macros
let @a='jVG' "Increase all numbers in following lines by 1
let @x='jVG' "Decrease all numbers in following lines by 1

"<-->
"Settings for C files.
autocmd FileType c	setlocal formatoptions=ctnqr
autocmd FileType c	map <silent> <C-c> :s/^/\/\//<CR>:noh<CR>
autocmd FileType c	map <silent> <C-u> :s/^\s*\/\///<CR>:noh<CR>
autocmd FileType c	set cindent
autocmd FileType c	inoremap ;cb /*<CR><CR>/<CR><++><Esc>2ka<Space>
autocmd FileType c	nnoremap <buffer> <F5>
			\ :w<CR>:!clear<CR>:!make<CR>
"autocmd FileType c inoremap ,main
"			\ <Esc>:-1r<Space>/home/linkai/Vorlagen/intmain.c<CR>
"			\2j$Fnla

"<-->
"Settings for C++ files.
autocmd FileType cpp setlocal formatoptions=ctnqr
autocmd FileType cpp map <silent> <C-c> :s/^/\/\//<CR>:noh<CR>
autocmd FileType cpp map <silent> <C-u> :s/^\s*\/\///<CR>:noh<CR>
autocmd FileType cpp set cindent
autocmd FileType cpp inoremap ;cb /*<CR><CR>/<CR><++><Esc>2ka<Space>
autocmd FileType cpp nnoremap <buffer> <F5>
			\ :w<CR>:!clear<CR>:!make<CR>
"<-->
"fast shebangs
nnoremap ,sh ggO#!/bin/sh<Esc>:w<CR>:e<CR><C-o>
nnoremap ,python ggO#!/bin/env<Space>python3<Esc>:w<CR>:e<CR><C-o>

"<-->
"conf file commenting
autocmd FileType conf map <silent> <C-c> :s/^/\#/<CR>:noh<CR>
autocmd FileType conf	map <silent> <C-u> :s/^\s*\#//<CR>:noh<CR>
"autocmd FileType conf nnoremap <F5> 
			\:w<CR>:!pkill cycle.out<CR>
			\:!i3-msg<Space>reload<CR>:!i3-msg<Space>restart<CR>

"<-->
"Settings for HTML files.
autocmd FileType html	vmap <silent> <C-c> :s/^/<!--/<CR>:'<,'>s/$/-->/<CR>:noh<CR>
autocmd FileType html	vmap <silent> <C-u> :s/^\s*<!--//<CR>:'<,'>s/-->$//<CR>:noh<CR>
autocmd FileType html
			\ inoremap <expr> <CR> pumvisible() ? "\<C-y>\>\<\/\<C-x>\<C-o>\<Esc>2ba" : "\<C-g>u\<CR>"
autocmd FileType html	inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
				\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
autocmd FileType html	inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
				\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
autocmd FileType html	inoremap < <<C-x><C-o><C-n>

"<-->
"Settings for Markdown
autocmd FileType markdown nnoremap <F5> :w<CR>:!clear<CR>:!pandoc -f markdown -t pdf "%" -o "%:r.pdf"<CR>
autocmd FileType markdown nnoremap <buffer> <F6> :!zathura --fork "%:r.pdf"<CR><CR>
autocmd FileType markdown nnoremap <buffer> <F6> :!zathura --fork "%:r.pdf"<CR><CR>
autocmd FileType markdown set tabstop=4
autocmd FileType markdown set shiftwidth=4
autocmd FileType markdown set formatoptions+=r
autocmd FileType markdown set comments=b:*,b:-,b:+,n:>
autocmd FileType markdown inoremap ;t <Esc>:r $HOME/Vorlagen/latex/traum.md<CR>ggdd/<++><CR>:noh<CR>"_c4l
autocmd FileType markdown inoremap ;% <C-r>%<Esc>dF.x

"<-->
"Settings for Matlab/Octave
autocmd FileType matlab map <silent> <C-c> :s/^/\%/<CR>:noh<CR>
autocmd FileType matlab	map <silent> <C-u> :s/^\s*%//<CR>:noh<CR>

"<-->
"Settings for Python files.
"Save and execute Python script from inside vim using F5.
autocmd FileType python
			\ nnoremap <buffer> <F5> :w<CR>:!clear<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <silent> <C-c> :s/^/\#/<CR>:noh<CR>
autocmd FileType python	map <silent> <C-u> :s/^\s*\#//<CR>:noh<CR>
autocmd FileType python	inoremap ;d """<CR>"""<CR><++><Esc>2ka
autocmd FileType python	inoremap ;> >>><Tab>

"PEP-8 Settings
autocmd FileType python	set tabstop=4
autocmd FileType python	set softtabstop=4
autocmd FileType python	set expandtab
autocmd FileType python	set shiftwidth=4
autocmd FileType python	set textwidth=79
autocmd FileType python	set fileformat=unix

"Folding configuration
autocmd FileType python	set foldmethod=indent
"    set foldlevel=1

"Auto-continue comments
autocmd FileType python	setlocal formatoptions=ctnqr

"<-->
"Settings for sh files.
autocmd FileType sh	map <silent> <C-c> :s/^/\#/<CR>:noh<CR>
autocmd FileType sh	map <silent> <C-u> :s/^\s*\#//<CR>:noh<CR>
autocmd FileType sh	nnoremap <silent> <F5> :w!<CR>:!clear<CR>:!sh %<CR>
autocmd FileType sh	set formatoptions+=r

"<-->
"Settings for zsh files.
autocmd FileType zsh	map <silent> <C-c> :s/^/\#/<CR>:noh<CR>
autocmd FileType zsh	map <silent> <C-u> :s/^\s*\#//<CR>:noh<CR>
autocmd FileType zsh	nnoremap <silent> <F5> :w!<CR>:!clear<CR>:!zsh %<CR>
autocmd FileType zsh	set formatoptions+=r

"<-->
"Settings for LaTeX files.
"Compile .tex file using <F5> and open with <F6> in Windows.
"Uncomment command below it,to use it in Linux.
"replace "zathura" with your own pdf viewer.
autocmd FileType plaintex	nnoremap <buffer> <F5> :w<CR>:!pdflatex "%" > /dev/null 2>&1 &<CR><CR>
autocmd FileType plaintex	nnoremap <buffer> <F6> :!zathura --fork "%:r".pdf<CR><CR>

"Commenting in a .tex file.
autocmd FileType plaintex map <silent> <C-c> :s/^/\%/<CR>:noh<CR>
autocmd FileType plaintex map <silent> <C-u> :s/^\s*%//<CR>:noh<CR>
autocmd FileType plaintex inoremap $ $$<Space><++><Esc>5hi
autocmd FileType plaintex inoremap $$ $
autocmd FileType plaintex inoremap ` ``'' <++><Esc>F`a
autocmd FileType plaintex inoremap ,qq \glqq\grqq{}<Space><++><Esc>F\i<Space>
autocmd FileType plaintex inoremap ,begin \begin{<CR><BS>\end{<Esc><C-v>$kA
autocmd FileType plaintex inoremap ,tmplt
			\ <Esc>:-1r<Space>/home/linkai/Vorlagen/template.tex<CR>

"Auto-continue \item
autocmd FileType plaintex setlocal formatoptions=ctnqr
autocmd FileType plaintex setlocal comments+=n:\\item,n:\\usepackage

"<-->
"Same settings for ft=tex
autocmd FileType tex nnoremap <buffer> <F5> :w<CR>:!pdflatex "%" > /dev/null 2>&1 &<CR><CR>
autocmd FileType tex nnoremap <buffer> <F6> :!zathura --fork "%:r".pdf<CR><CR>

"Commenting in a .tex file.
autocmd FileType tex map <silent> <C-c> :s/^/\%/<CR>:noh<CR>
autocmd FileType tex map <silent> <C-u> :s/^\s*%//<CR>:noh<CR>
autocmd FileType tex inoremap $ $$<Space><++><Esc>5hi
autocmd FileType tex inoremap $$ $
autocmd FileType tex inoremap ` ``'' <++><Esc>F`a
autocmd FileType tex inoremap ,qq \glqq\grqq{}<Space><++><Esc>F\i<Space>
autocmd FileType tex inoremap ,begin \begin{<CR><BS>\end{<Esc><C-v>$kA
autocmd FileType tex inoremap ,tmplt
			\ <Esc>:-1r<Space>/home/linkai/Vorlangen/template.tex<CR>

"Auto-continue \item
autocmd FileType tex setlocal formatoptions=ctnqr
autocmd FileType tex setlocal comments+=n:\\item,n:\\usepackage

"<-->
"Settings for Vim files.
autocmd FileType vim	nnoremap <silent> <C-c> :s/^/\"/<CR>:noh<CR>
autocmd FileType vim	nnoremap <silent> <C-u> :s/^\s*\"//<CR>:noh<CR>
autocmd FileType vim	vnoremap <silent> <C-c> :s/^/\"/<CR>:noh<CR>
autocmd FileType vim	vnoremap <silent> <C-u> :s/^\s*\"//<CR>:noh<CR>
autocmd FileType vim	inoremap < <><Space><++><Esc>5hi
autocmd FileType vim	inoremap << <
autocmd FileType vim	inoremap <> <>
"General markings. Will not get deleted upon reaching them. Jump with <CR>.
"Fold the "<--> pattern
autocmd FileType vim setlocal foldmethod=expr
autocmd FileType vim setlocal
			\ foldexpr=(getline(v:lnum)=='\"\<\-\-\>')?0:(getline(v:lnum-1)=='\"\<\-\-\>')\\|\\|(getline(v:lnum+1)=='\"\<\-\-\>')?1:2

"<-->
"Automatically make closing brackets/quote.
"Double tap if not wanted
inoremap { {}<++><Esc>4hi
inoremap {<CR> {<CR>}<CR><CR><++><Esc>2kO
inoremap {{ {
inoremap {} {}
inoremap ( ()<++><Esc>4hi
inoremap (<CR> (<CR>)<CR><CR><++><Esc>2kO
inoremap (( (
inoremap () ()
inoremap [ []<++><Esc>4hi
inoremap [<CR> [<CR>]<CR><CR><++><Esc>2kO
inoremap [[ [
inoremap [] []
inoremap " ""<++><Esc>4hi
inoremap "" "
inoremap ' ''<++><Esc>4hi
inoremap '' '


"<-->
"Make brackets, quotes etc. around selected text.
"Replaces content in the " register.
vnoremap () s(<C-r>")<Esc>
vnoremap [] s[<C-r>"]<Esc>
vnoremap {} s{<C-r>"}<Esc>
vnoremap '' s'<C-r>"'<Esc>
vnoremap "" s"<C-r>""<Esc>

"<-->
"Jump to <++>. use ";<" to quickly make this tag.
"inoremap <Space><Space> <Esc>/<++><CR>:noh<CR>"_c4l
inoremap <C-c> <Esc>/<++><CR>:noh<CR>"_c4l
inoremap ;< <++><Esc>

"<-->
"Better key bindings to navigate/resize splitscreens.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap < <C-w><
nnoremap > <C-w>>

"Faster scrolling
"nnoremap <C-e> <C-e><C-e>
"nnoremap <C-y> <C-y><C-y>

"<-->
"scrolling
inoremap <C-e> <C-o><C-e>
inoremap <C-y> <C-o><C-y>
inoremap <C-j> <C-o><C-e>
inoremap <C-k> <C-o><C-y>
nnoremap J <C-e>
nnoremap K <C-y>

"Save clipboard upon exiting vim.
autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))

"<-->
"ctags stuff
nnoremap ü <C-]>
nnoremap Ü <C-t>

"<-->
"Use powerline instead of vim statusline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup