set nocompatible              " be iMproved, required
filetype off                  " required
set exrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugin Manager
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'NLKNguyen/papercolor-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Dark Material Theme
set background=dark
colorscheme PaperColor

" Line numbers and status bar
set number
set laststatus=2

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
":set guioptions-=m  "remove menu bar
":set guioptions-=T  "remove toolbar
":set guioptions-=r  "remove right-hand scroll bar
":set guioptions-=L  "remove left-hand scroll bar

" Disable the stupid beeping
set visualbell

" ==== disable mouse
set mouse=c

" Open new split panes to right and bottom
set splitbelow
set splitright

" Global YCM Config file
let g:ycm_global_ycm_extra_conf="/root/.vim/bundle/.ycm_extra_conf.py"

" YCM Jump to Command
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
