version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
"let g:Powerline_symbols = 'fancy'
set cpo&vim
map! <S-Insert> <MiddleMouse>
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>

vnoremap <F1> <ESC>
map <S-Insert> <MiddleMouse>
let &cpo=s:cpo_save
unlet s:cpo_save
syntax enable

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Eclim stuff
filetype plugin indent on
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
let g:EclimBrowser = 'open'

"" NERDTree stuff
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
" au VimEnter * NERDTree
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

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

" cpp compile
map <F10> :call CompileCPP()<CR>

func! CompileCPP()
	:w
	:!g++ -o "%:t:r" "%" && mv -f "%:t:r" ../Debug/
endfunc

" run cpp program
map <F11> :call RunCppProgram()<CR>

func! RunCppProgram()
	:!clear && ../Debug/"%:t:r"
endfunc

" java compile
"map <F10> :call CompileJava()<CR>

func! CompileJava()
	:w
	:!javac "%" && mv -f "%:t:r".class ../bin/
endfunc

" run class
"map <F11> :call RunJavaClass()<CR>

func! RunJavaClass()
	:!clear && java -cp ../bin/ "%:t:r"
endfunc

" run the current file as a ruby script
"map <F12> :call RunRuby() <CR>
func! RunRuby()
	:!ruby "%"
endfunc


set background=dark
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Deja\ Vu\ Sans\ Mono\ 12
set guioptions=egmrLt
set helplang=en
set history=50
set laststatus=2
set modelines=0
set mouse=a
set nocompatible
set ruler
set shiftwidth=4
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=4
set termencoding=utf-8
set window=35
set number
" vim: set ft=vim :
"colors ir_black
"colors neverland2
colors molokai
