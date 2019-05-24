"Some nice basic settings
set nocompatible
filetype on
filetype indent plugin on
set omnifunc=syntaxcomplete#Complete
set encoding=utf-8
colo transtorte
"colo torte
set nu
set relativenumber
set wildmenu
set ruler
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
syntax on
nnoremap <Space> :

"Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"<-->
"Settings for C files.
autocmd FileType c	setlocal formatoptions=ctnqr
autocmd FileType c	map <silent> <C-c> :s/^/\/\//<CR>:noh<CR>
autocmd FileType c	map <silent> <C-u> :s/^\s*\/\///<CR>:noh<CR>
autocmd FileType c	set cindent
autocmd FileType c	inoremap ,cb /*<CR><CR>/<CR><++><Esc>2ka<Space>
autocmd FileType c	nnoremap <buffer> <F5>
			\ :w<CR>:!clear<CR>:!gcc % -o %:r.out<CR>:!./%:r.out<CR>
autocmd FileType c inoremap ,main
			\ <Esc>:-1r<Space>/home/linkai/Vorlagen/intmain.c<CR>
			\2j$Fnla

"<-->
"i3 conf file commenting
autocmd FileType conf map <silent> <C-c> :s/^/\#/<CR>:noh<CR>
autocmd FileType conf	map <silent> <C-u> :s/^\s*\#//<CR>:noh<CR>
autocmd FileType conf nnoremap <F5> 
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
"Settings for Python files.
"Save and execute Python script from inside vim using F5.
autocmd FileType python
			\ nnoremap <buffer> <F5> :w<CR>:!clear<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python map <silent> <C-c> :s/^/\#/<CR>:noh<CR>
autocmd FileType python	map <silent> <C-u> :s/^\s*\#//<CR>:noh<CR>
autocmd FileType python	inoremap ;ds """<CR>"""<CR><++><Esc>2ka
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
autocmd FileType python	nnoremap z zA

"Auto-continue comments
autocmd FileType python	setlocal formatoptions=ctnqr

"<-->
"Settings for bash files.
autocmd FileType sh	map <silent> <C-c> :s/^/\#/<CR>:noh<CR>
autocmd FileType sh	map <silent> <C-u> :s/^\s*\#//<CR>:noh<CR>
autocmd FileType sh	nnoremap <silent> <F5> :w!<CR>:!clear<CR>:!bash %<CR>

"<-->
"Settings for LaTeX files.
"Compile .tex file using <F5> and open with <F6> in Windows.
"Uncomment command below it,to use it in Linux.
"replace "zathura" with your own pdf viewer.
"autocmd FileType plaintex	nnoremap <buffer> <F5> :w<CR>:!start /b pdflatex -shell-escape %<CR>
"autocmd FileType plaintex	nnoremap <buffer> <F6> :silent !start "%:r.pdf"<CR>
autocmd FileType plaintex	nnoremap <buffer> <F5> :w<CR>:!pdflatex % > /dev/null 2>&1 &<CR><CR>
autocmd FileType plaintex	nnoremap <buffer> <F6> :!zathura --fork %:r.pdf<CR><CR>

"Commenting in a .tex file.
autocmd FileType plaintex map <silent> <C-c> :s/^/\%/<CR>:noh<CR>
autocmd FileType plaintex map <silent> <C-u> :s/^\s*%//<CR>:noh<CR>
autocmd FileType plaintex inoremap $ $$<Space><++><Esc>5hi
autocmd FileType plaintex inoremap $$ $
autocmd FileType plaintex inoremap ;qq \glqq\grqq{}<Space><++><Esc>F\i<Space>
autocmd FileType plaintex inoremap ;begin \begin{<CR><BS>\end{<Esc><C-v>$kA
autocmd FileType c inoremap ,tmplt
			\ <Esc>:-1r<Space>/home/linkai/Vorlagen/template.tex<CR>

"Auto-continue \item
autocmd FileType plaintex setlocal formatoptions=ctnqro
autocmd FileType plaintex setlocal comments+=n:\\item,n:\\usepackage

"<-->
"Same settings for ft=tex
"autocmd FileType tex	nnoremap <buffer> <F5> :w<CR>:!start /b pdflatex -shell-escape %<CR>
"autocmd FileType tex	nnoremap <buffer> <F6> :silent !start "%:r.pdf"<CR>
autocmd FileType tex	nnoremap <buffer> <F5> :w<CR>:!clear<CR>:!pdflatex % > /dev/null 2>&1 &<CR><CR>
autocmd FileType tex	nnoremap <buffer> <F6> :!zathura --fork %:r.pdf<CR><CR>

"Commenting in a .tex file.
autocmd FileType tex map <silent> <C-c> :s/^/\%/<CR>:noh<CR>
autocmd FileType tex map <silent> <C-u> :s/^\s*%//<CR>:noh<CR>
autocmd FileType tex inoremap $ $$<Space><++><Esc>5hi
autocmd FileType tex inoremap $$ $
autocmd FileType tex inoremap ;qq \glqq\grqq{}<Space><++><Esc>F\i<Space>
autocmd FileType tex inoremap ;begin \begin{<CR><BS>\end{<Esc><C-v>$kA
autocmd FileType c inoremap ,tmplt
			\ <Esc>:-1r<Space>/home/linkai/Vorlangen/template.tex<CR>

"Auto-continue \item
autocmd FileType tex setlocal formatoptions=ctnqro
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
autocmd FileType vim noremap ;<CR> o"<--><Esc>
autocmd FileType vim noremap <CR> /<--><CR>

"<-->
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


"<-->
"Make brackets, quotes etc. around selected text.
"Replaces content in the " register.
vnoremap () s(<C-r>")<Esc>
vnoremap [] s[<C-r>"]<Esc>
vnoremap {} s{<C-r>"}<Esc>
vnoremap '' s'<C-r>"'<Esc>
vnoremap "" s"<C-r>""<Esc>

"<-->
"Jump to <++>. use ";tag" to quickly make this tag.
inoremap <Space><Space> <Esc>/<++><CR>:noh<CR>"_c4l
inoremap ,tag <++><Esc>

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
