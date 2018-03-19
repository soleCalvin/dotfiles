set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required
set exrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugin Manager
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'skielbasa/vim-material-monokai'

Plugin 'itchyny/lightline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Add the CtrlP Plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0

if !has("gui_running")
    set term=xterm-256color
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme material-monokai
endif

" Line numbers and status bar
set number
set relativenumber
set laststatus=2
set noshowmode

" Leader is comma
let mapleader = ","

" Enable Syntax highlighting
if !exists("syntax_on")
    syntax enable
endif

set autowrite 		"automatically :write before running commands
set shiftwidth=4
set tabstop=4 		" Width of the tab character
set autoindent
set textwidth=100
set colorcolumn=+1
set history=100

" Highlighted search
set hlsearch
set incsearch
nnoremap <silent> <leader><space> :nohlsearch<CR>

" Visual autocomplete
set wildmenu

" Redraw the screen less often
set lazyredraw

" Disable the stupid beeping
set visualbell

" ==== disable mouse
set mouse=c

" Open new split panes to right and bottom
set splitbelow
set splitright

" Global YCM Config file
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/.ycm_extra_conf.py"

" YCM Jump to Command
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" YCM Fixit
nnoremap <leader>f :YcmCompleter FixIt<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Highlight current line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Get block cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[1 q"

" Folds
set foldlevelstart=0
nnoremap <space> zA 	" Use this command to toggle fold
set foldmethod=indent

" Select the previously inserted text
nnoremap gV `[v`]

" Brighten Lines
highlight LineNr ctermfg=grey
highlight CursorLineNr ctermfg=grey

" Add automatic braces
inoremap {<CR> {<CR>}<ESC>O 
