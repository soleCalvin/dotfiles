" Plugin Management --------------------------------------------------
set shell=/bin/bash
set nocompatible
filetype plugin on
set exrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" BEGIN PLUGIN LIST
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'morhetz/gruvbox'

Plugin 'itchyny/lightline.vim'
" END PLUGIN LIST

call vundle#end()
filetype plugin indent on

" CtrlP Plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0

" Global YCM Config file
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/.ycm_extra_conf.py"

" Theme Customization ------------------------------------------------
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'medium'
set background=dark
colorscheme gruvbox

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

" Enable Syntax highlighting
if !exists("syntax_on")
	syntax enable
endif

" Highlighted search
set hlsearch
set incsearch
set ignorecase
set smartcase
map N Nzz
map n nzz

" Visual autocomplete
set wildmenu

" Redraw the screen less often
set lazyredraw

" Disable the stupid beeping
set visualbell

" ==== disable mouse
set mouse=c

" Highlight current line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Get block cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[1 q"

" Folds
set foldlevelstart=0
set foldmethod=indent
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Brighten Lines
highlight LineNr ctermfg=grey
highlight CursorLineNr ctermfg=grey

" Autoclose buffers
set nohidden

"{{{ Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
	if g:paste_mode == 0
		set paste
		let g:paste_mode = 1
	else
		set nopaste
		let g:paste_mode = 0
	endif
	return
endfunc

" Automatically trim trailing whitespace in files
fun! TrimWhitespace()
	let l:save = winsaveview()
	%s/\s\+$//e
	call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" Custom Mappings-----------------------------------------------------
" Leader is comma
let mapleader = ","

" YCM
nnoremap <leader>jd :YcmCompleter GoTo<CR>		" Jump to Command
nnoremap <leader>f :YcmCompleter FixIt<CR> 		" FixIt
nnoremap <leader>gt :YcmCompleter GetType<CR> 	" Get type of variable

" Paste Mode on F12
nnoremap <silent> <F12> :call Paste_on_off()<CR>
set pastetoggle=<F12>

" Quicker window switching
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Toggle between folds
nnoremap <space> zA

" Select the previously inserted text
nnoremap gV `[v`]

" Add automatic braces
inoremap {<CR> {<CR>}<ESC>O

" jk exits insert mode
inoremap jk <Esc>

" Cancel search highlighting
nnoremap <silent> <leader><space> :nohlsearch<CR>
