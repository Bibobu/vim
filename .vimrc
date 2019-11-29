" Dr. G.Clavier wonderful vimrc file
set encoding=utf-8

" Les couleurs
colorscheme turlututu
syntax on

" Des options que j'aime bien
" Wrap les lignes
set wrap
set showcmd
set cursorline
set wildmenu
set showmatch
set incsearch
set hlsearch

" Active l'indentation
filetype plugin indent on
set foldmethod=indent
set nofoldenable
set ruler
" Indentation sans putains de tabulations de merde
set tabstop=4
set shiftwidth=4
set expandtab
" Affiche les numéros de lignes
set number relativenumber
" Commente automatiquement en dessous des commentaires
" uniquement en insert mode
set formatoptions+=cr

" J'ai piqué la statusline de quelqu'un
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

" Va chercher mes templates pour différents formats
autocmd bufnewfile *.f90 0r /home/gclavier/.vim/template.f90
autocmd bufnewfile *.py  0r /home/gclavier/.vim/template.py
autocmd bufnewfile *.tex 0r /home/gclavier/.vim/template.tex
autocmd bufnewfile *.sh  0r /home/gclavier/.vim/template.sh
autocmd bufnewfile *.ms  0r /home/gclavier/.vim/template.ms

" Commandes utiles pour LaTeX
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

