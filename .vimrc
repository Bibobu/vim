" Dr. G.Clavier wonderful vimrc file
set encoding=utf-8

" My colorset
colorscheme turlututu
syntax on

" Options I like
" Wrap lines
set wrap
set showcmd
set cursorline
set wildmenu
set showmatch
set incsearch
set hlsearch

" set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•
" set list

" Indent
filetype plugin indent on
set foldmethod=indent
set nofoldenable
set ruler
" Indent without fucking tabs
set tabstop=4
set shiftwidth=4
set expandtab
" Displya relative line number
set number relativenumber
" Starts line with new comments below comment line
" Only in insert mode
set formatoptions+=cr

" I stole this from someone
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ REPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ \%n\          " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#
set statusline+=%F
set statusline+=%M
set statusline+=%#Cursor#
set statusline+=%#CursorLine#
set statusline+=\ %t\
set statusline+=%=
set statusline+=%#CursorLine#
set statusline+=\ %Y\
set statusline+=%#CursorIM#
set statusline+=\ %3l:%-2c\  " line + column
set statusline+=%#Cursor#
set statusline+=\ %3p%%\  " percentage

" Smart remapping
let mapleader = "\<Space>"

" I finished Dark Souls 1, 2 and 3.
" I play Vim the hardcore way
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
inoremap <left> <nop>
inoremap <esc> <nop>

" People suck but I still want to
" be able to go out of Vim insert mode
" at some points in order to eat and sleep.
inoremap jk <esc>

" Edit and load .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Surround word by ' or " in normal mode
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Surround visually selected region by ' or " in visual mode
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>

" Get my templates for usual formats
autocmd bufnewfile *.f90 0r /home/gclavier/.vim/template.f90
autocmd bufnewfile *.py  0r /home/gclavier/.vim/template.py
autocmd bufnewfile *.tex 0r /home/gclavier/.vim/template.tex
autocmd bufnewfile *.sh  0r /home/gclavier/.vim/template.sh
autocmd bufnewfile *.ms  0r /home/gclavier/.vim/template.ms

" Useful comments commands for commenty comments
autocmd filetype python  nnoremap <buffer> <leader>c ^i#<Space><esc>
autocmd filetype tex     nnoremap <buffer> <leader>c ^i%<Space><esc>
autocmd filetype fortran nnoremap <buffer> <leader>c ^i!<Space><esc>
autocmd filetype vim     nnoremap <buffer> <leader>c ^i"<Space><esc>

" Useful command for my pythonic python coding
autocmd filetype python :iabbrev <buffer> iff if:<left>
autocmd filetype python :iabbrev <buffer> eif elif:<left>
autocmd filetype python :iabbrev <buffer> eff else:<cr>

" Useful commands for my LaTeXiLaTeX
autocmd FileType tex inoremap ;b \begin{}<Enter><Enter>\end{}<Up><Up><Right>
autocmd FileType tex inoremap ;beq \begin{equation}<Enter><Enter>\end{equation}<Up><Up><Right>
autocmd FileType tex inoremap ;bit \begin{itemize}<Enter>  \item<Enter>  \item<Enter>  \item<Enter>\end{itemize}<Esc>3k$
autocmd FileType tex inoremap ;bce \begin{center}<Enter><Enter>\end{center}<Up><Up><Right>
autocmd FileType tex inoremap ;bfi \begin{figure}<Enter><Enter>\end{figure}<Up><Up><Right>

autocmd FileType tex inoremap \sc \section{}
autocmd FileType tex inoremap \ssc \subsection{}
autocmd FileType tex inoremap \sssc \subsubsection{}
autocmd FileType tex inoremap \int \int
autocmd FileType tex inoremap \int_ \int_{}^{}<Esc>3hi
autocmd FileType tex inoremap \frac \frac{}{}<Esc>2hi

" vimplug related plugins
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'dense-analysis/ale'

call plug#end()

" ALE related commands
" Warning message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Global fixers
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'],
            \        'python': ['black']
            \      }

" Personal functions
function Topots(maxtime,dumptime,dt)
    let nstep = a:maxtime/a:dt
    let ndump = a:dumptime/a:dt
    let timestep = 0
    while l:timestep <= l:nstep
        execute ":normal! A ". l:timestep."\n"
        let temp = l:timestep+1
        execute ":normal! A ". l:temp."\n"
        let timestep += l:ndump
    endwhile
endfunction

