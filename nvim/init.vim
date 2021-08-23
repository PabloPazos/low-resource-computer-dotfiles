" -------------------- Global configuration --------------------
syntax enable

set mouse=a
set noerrorbells
set smartindent
set number
set rnu
set numberwidth=1
set noswapfile
set nobackup
set incsearch
set ignorecase
set clipboard=unnamedplus
set encoding=UTF-8
set showmatch
set cursorline
set termguicolors
set guifont=Mononoki\ Nerd\ Font\ NF:h12
set colorcolumn=120

"Indent
filetype plugin indent on
set expandtab
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent

" NERDTree
highlight ColoColumn ctermbg=0 guibg=lightgrey
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeGitStatusUseNerdFonts = 1 
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Top Tab. Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" 
let g:airline_theme='bubblegum'
" Prettier auto save.
" let g:prettier#autoformat = 0
" let g:prettier#quickfix_enabled = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" ALE
let g:ale_fixers = {
 \ 'javascript': ['prettier'],
 \ 'css': ['prettier'],
 \ 'html': ['prettier'],
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" -------------------- Plugins --------------------
call plug#begin('~/.local/share/nvim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'folke/tokyonight.nvim'

" Functionality
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' 
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-python/python-syntax'

" Code modification
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'chun-yang/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

"Plug 'shutnik/jshint2.vim'
" post install (yarn install | npm install) then load plugin only for editing supported files
"Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install',
"  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Visual
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'lilydjwg/colorizer'
Plug 'leafgarland/typescript-vim'

" Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

call plug#end()

" -------------------- Themes config --------------------
" colorscheme tokyonight
" let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
set background=dark
let ayucolor="mirage"
let g:gruvbox_contrast_dark="hard"
" colorscheme onedark
colorscheme gruvbox

" -------------------- Shortcuts --------------------
let mapleader = " "

" Search
nmap <leader>s <Plug>(easymotion-s2)

" Files
nmap <leader>nt :NERDTreeFind<CR>
map <Leader>nf :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1
function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

" Reload
nmap <F6> :source ~/.config/nvim/init.vim<CR>
vmap <F6> :source ~/.config/nvim/init.vim<CR>

" Save
nmap <leader>w :w<CR>

" Split vertical de terminal
vnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>

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

" Agregar fecha a un archivo
nmap <F5> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F5> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

"Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ------------------- JSHint -------------------
" Lint JavaScript files after reading it.
" let jshint2_read = 1
" jshint validation
" nnoremap <silent><F2> :JSHint<CR>
" inoremap <silent><F2> <C-O>:JSHint<CR>
" vnoremap <silent><F2> :JSHint<CR>

" show next jshint error
" nnoremap <silent><F3> :lnext<CR>
" inoremap <silent><F3> <C-O>:lnext<CR>
" vnoremap <silent><F3> :lnext<CR>

" show previous jshint error
" nnoremap <silent><F4> :lprevious<CR>
" inoremap <silent><F4> <C-O>:lprevious<CR>
" vnoremap <silent><F4> :lprevious<CR>
