" ------ Global configuration ------
syntax enable

set mouse=a
set noerrorbells
set sw=2
set expandtab
set smartindent
set number
set rnu
set numberwidth=1
set nowrap
set noswapfile
set nobackup
set incsearch
set ignorecase
set clipboard=unnamedplus
set encoding=utf-8
set showmatch
set cursorline
set termguicolors

set colorcolumn=120
highlight ColoColumn ctermbg=0 guibg=lightgrey

" ------ Plugins ------
call plug#begin('~/.local/share/nvim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'

" Functionality
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-python/python-syntax'

" Code modification
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'chun-yang/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Visual
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
Plug 'leafgarland/typescript-vim'

" Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

call plug#end()

" ------ Themes config ------
set background=dark
let ayucolor="mirage"
let g:gruvbox_contrast_dark="hard"
colorscheme onedark

" ------ Shortcuts ------
let mapleader = " "

" Search
nmap <leader>s <Plug>(easymotion-s2)

" Files
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

" Reload
nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>

" Save
nmap <leader>w :w<CR>

" resize
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>
nnoremap <leader>e :e $MYVIMRC<CR>

" Moverse al buffer siguiente con <lider> + k
nnoremap <leader>k :bnext<CR>

" Moverse al buffer anterior con <lider> + j
nnoremap <leader>j :bprevious<CR>

" Cerrar el buffer actual con <lider> + q
nnoremap <leader>q :bdelete<CR>

" Crear una nueva ventana
nnoremap <leader>t :tabe<CR>

" Hacer un split vertical
nnoremap <leader>vs :vsp<CR>

" Hacer un split horizontal
nnoremap <leader>sp :sp<CR>

