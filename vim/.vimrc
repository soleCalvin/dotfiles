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

Plugin 'majutsushi/tagbar'

Plugin 'morhetz/gruvbox'

Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-airline/vim-airline'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'roman/golden-ratio'
" END PLUGIN LIST

call vundle#end()
filetype plugin indent on

" Make airline pretty
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#formatter = 'unique_tail'

" Config file for YCM
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" Theme Customization ------------------------------------------------
set termguicolors
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_contrast_light = 'medium'
set background=dark
colorscheme gruvbox

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

" Enable Syntax highlighting
if !exists("syntax_on")
	syntax enable
endif

" netrw Listing Style
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_altv = 1

" Highlighted search
set hlsearch
set incsearch
set ignorecase
set smartcase

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

" Resizing windows
nnoremap <silent> <Leader><Left> :vertical resize -5<CR>
nnoremap <silent> <Leader><Right> :vertical resize +5<CR>
nnoremap <silent> <Leader><Up> :resize -5<CR>
nnoremap <silent> <Leader><Down> :resize +5<CR>

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

" Cancel search highlighting
nnoremap <silent> <leader><space> :nohlsearch<CR>

" Natural movement through long lines
nnoremap j gj
nnoremap k gk

" Tagbar
noremap <leader>b :TagbarToggle<CR>

" Jump to ctags
nnoremap <Leader>t g<C-]>

" Jump to YCM GoTo
nnoremap <Leader>g :YcmCompleter GoTo<CR>
nnoremap <Leader>f :YcmCompleter FixIt<CR>

" Goldenview Window Management
nnoremap <silent> <Leader>s <Plug>GoldenViewSplit
