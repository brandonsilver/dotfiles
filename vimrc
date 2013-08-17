" Pathogen
call pathogen#infect()
call pathogen#helptags()


" Miscellaneous Settings
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
syntax on
set number
"set mouse=a
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

" Theme Settings
set background=dark
colors molokai


" Nerdtree
"autocmd vimenter * NERDTree
map <C-l> :tabn<CR>
map <c-h> :tabp<CR>
map <c-n> :tabnew<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
   if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction


" vim-powerline
"let Powerline_symbols = 'unicode'


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
