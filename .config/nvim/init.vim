" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'scrooloose/nerdtree'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Start Deoplete
let g:deoplete#enable_at_startup = 1

" C++ Autocomplete Settings
let g:LanguageClient_serverCommands = {
\ 'cpp': ['clangd'],
\ }
" let g:LanguageClient_loadSettings = 1
let g:LanguageClient_autoStart = 1
" Use an absolute configuration path if you want system-wide settings
" let g:LanguageClient_settingsPath = '/home/yourusername/.config/nvim/settings.json'

set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'medium'
colorscheme gruvbox
set background=dark

" Make airline pretty
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#formatter = 'unique_tail'

" Disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Standard Location for Swaps
set directory=~/.vim/swap//

" Misc Convenience Settings ------------------------------------------
set number
set relativenumber
set laststatus=2
set noshowmode
set autowrite           "automatically :write before running commands
set shiftwidth=4
set tabstop=4           " Width of the tab character
set autoindent
set textwidth=100
set colorcolumn=+1
set splitright
set scrolloff=10        " Leave 10 lines at top/bottom

" Enable Syntax highlighting
if !exists("syntax_on")
        syntax enable
endif

" Highlighted search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Visual autocomplete
set wildmenu

" Redraw the screen less often
set lazyredraw

" ==== disable mouse
set mouse=c

" Highlight current line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Folds
set foldlevelstart=0
set foldmethod=indent
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

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

" Custom Mappings-----------------------------------------------------
" Leader is comma
let mapleader = ","

" Resizing windows
nnoremap <silent> <Leader><Left> :vertical resize -5<CR>
nnoremap <silent> <Leader><Right> :vertical resize +5<CR>
nnoremap <silent> <Leader><Up> :resize -5<CR>
nnoremap <silent> <Leader><Down> :resize +5<CR>

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

" Some Language Server Commands?
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
