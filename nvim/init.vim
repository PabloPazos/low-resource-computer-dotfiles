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
let g:airline_theme='ayu'


" -------------------- Prettier --------------------
" Prettier auto save.
let g:prettier#autoformat = 0

" let g:prettier#quickfix_enabl nred = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

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

" TypeScript and React Development
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

call plug#end()

" -------------------- TypeScript and React Development --------------------
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Display diagnostics (errors and warnings)
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" Go to actions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)

" -------------------- Themes config --------------------
" colorscheme tokyonight
" let g:tokyonight_style = "night"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
" set background=dark
" let g:gruvbox_contrast_dark="hard"
let ayucolor="dark"
" colorscheme onedark
colorscheme ayu

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

" Rename file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

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

