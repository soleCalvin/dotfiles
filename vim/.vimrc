" Plugin Management --------------------------------------------------
set nocompatible
filetype plugin on

set enc=utf-8

silent!call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-surround'

call plug#end()

colorscheme gruvbox

set background=light

" Disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Misc Convenience Settings ------------------------------------------
set number
set relativenumber
set laststatus=2
set noshowmode
set autowrite 		"automatically :write before running commands
set shiftwidth=4
set tabstop=4 		" Width of the tab character
set autoindent
set textwidth=100
set colorcolumn=+1
set splitright
set scrolloff=10 	" Leave 10 lines at top/bottom

" Enable Syntax highlighting
if !exists("syntax_on")
	syntax enable
endif

" GUI settings
if has("gui_running")
	set guifont=SimHei:h13
	set lines=50 columns=110
endif

" Highlighted search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Visual autocomplete
set wildmenu

" Brighten Lines
highlight LineNr ctermfg=grey
highlight CursorLineNr ctermfg=grey


" Autoclose buffers
set nohidden

" Automatically trim trailing whitespace in files
fun! TrimWhitespace()
	let l:save = winsaveview()
	%s/\s\+$//e
	call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" Natural movement through long lines
nnoremap j gj
nnoremap k gk

