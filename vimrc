" Pathogen
call pathogen#infect()
call pathogen#helptags()


" Miscellaneous Settings
"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
syntax on
set number
set mouse=a
set mousehide
set encoding=utf-8
set laststatus=2
set nocompatible
set hlsearch
set showmatch
set autoindent
set history=1000
set cursorline
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set bs=2
set tw=100

" Theme Settings
"set background=dark
"colors molokai
" Fixes wierd behavior with suckless terminal (st) flipping terminal colors
if (&term =~? 'st-256color' || &term =~? 'screen-256color') && !has('gui_running')
    set background=dark
else
    set background=light
endif
colors solarized
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
"let g:solarized_termcolors=256

" Nerdtree
"autocmd vimenter * NERDTree
"map <C-l> :tabn<CR>
"map <c-h> :tabp<CR>
"map <c-n> :tabnew<CR>
"let NERDTreeShowBookmarks=1
"let NERDTreeChDirMode=0
"let NERDTreeQuitOnOpen=1
"let NERDTreeMouseMode=2
"let NERDTreeShowHidden=1
"let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
"let NERDTreeKeepTreeInNewTab=1
"let g:nerdtree_tabs_open_on_gui_startup=0
"" Close all open buffers on entering a window if the only
"" buffer that's left is the NERDTree buffer
"function! s:CloseIfOnlyNerdTreeLeft()
"   if exists("t:NERDTreeBufName")
"    if bufwinnr(t:NERDTreeBufName) != -1
"      if winnr("$") == 1
"        q
"      endif
"    endif
"  endif
"endfunction


" vim-powerline
"let Powerline_symbols = 'unicode'

" new powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" My custom keybindings

" Toggle paste indentation
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" cpp compile
"map <F10> :call CompileCPP()<CR>
func! CompileCPP()
    :w
    :!g++ -o "%:t:r" "%" && mv -f "%:t:r" ../Debug/
endfunc
" run cpp program
"map <F11> :call RunCppProgram()<CR>
func! RunCppProgram()
  :!clear && ../Debug/"%:t:r"
endfunc

" java compile
map <F10> :call CompileJava()<CR>
func! CompileJava()
  :w
  :!javac "%" && mv -f "%:t:r".class ../bin/
endfunc

" run class
map <F11> :call RunJavaClass()<CR>
func! RunJavaClass()
  :!clear && java -cp ../bin/ "%:t:r"
endfunc

" run the current file as a ruby script
"map <F12> :call RunRuby() <CR>
func! RunRuby()
  :!ruby "%"
endfunc

" Convert the current file to HTML from Asciidoc
func! ConvertCurrentFileFromAsciidocToHTML()
    :w
    :!asciidoc -o "%:t:r".html "%"
endfunc
map <F11> :call ConvertCurrentFileFromAsciidocToHTML() <CR>
" Convert the current file to HTML
func! CreateHtmlFromCurrentFile()
    :w
    :!pandoc -o "%:t:r".html "%"
endfunc
map <F12> :call CreateHtmlFromCurrentFile() <CR>
