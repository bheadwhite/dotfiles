call plug#begin()

"colorschemes
Plug 'joshdick/onedark.vim'
"Plug 'morhetz/gruvbox'
"Plug 'dikiaap/minimalist' "color scheme
Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'Brettm12345/moonlight.vim'
"Plug 'sainnhe/sonokai'

"editing
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --ts-completer' }
Plug 'Quramy/tsuquyomi' "completion engine
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim' "git looking at commit browser
Plug 'airblade/vim-gitgutter'

" Syntax Highlighting
"Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'

"Plug 'vim-utils/vim-man'

Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'

"Plug 'vim-scripts/xptemplate' "code snippet engine
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'gcmt/taboo.vim'
Plug 'w0rp/ale'
Plug 'Valloric/MatchTagAlways'
Plug 'ntpeters/vim-better-whitespace'
Plug 'fatih/vim-go'
Plug 'ejholmes/vim-forcedotcom'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-rooter'
Plug 'ap/vim-css-color'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mhinz/vim-startify'
Plug 'wesQ3/vim-windowswap'
Plug 'itchyny/lightline.vim'

"performance
Plug 'Shougo/vimproc.vim', {'do' : 'make'} "async lib

call plug#end()

set tabstop=2 softtabstop=2
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
set shiftwidth=2
set ignorecase
set nohlsearch
set nu noswf
set nobackup
set expandtab
set smartindent
set smarttab
set nowrap
set incsearch
set splitright
set diffopt+=vertical
silent! set splitvertical
set splitbelow
set noerrorbells visualbell t_vb=
set noea
set colorcolumn=100
set eadirection=ver
set clipboard=unnamed        " Yank and paste with the system clipboard
highlight ColorColumn ctermbg=8
set guifont=Menlo\ Regular:h17
set timeoutlen=1000 ttimeoutlen=0
set mouse=a
set backspace=indent,eol,start
syntax enable on

let mapleader = " "

"colors
if (has("termguicolors"))
  set termguicolors
endif

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

set background=dark

colorscheme onedark

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" move lines up/down in visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" faster pane switching/window management
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <D-l> $
nnoremap <D-h> ^
nnoremap ˙ b
nnoremap ¬ e

map <D-w> :q<CR>

nnoremap <D-L> <C-W>L
nnoremap <D-H> <C-W>H
inoremap <D-l> <C-o>a
inoremap <d-h> <C-o>i

" saving
map <D-s> :w <bar> :!echo "saved"<CR>

" resizing windows
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" nerdtree
map <leader>k :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>

" undo tree
if has("persistent_undo")
  set undodir=$HOME."/.undodir"
  set undofile
endif

map <leader>u :UndotreeToggle<CR>

" ycm
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_hover = ''
let g:ycm_key_list_select_completion = ['∆', '<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['˚', '<S-TAB>', '<Up>']
let g:ycm_use_ultisnips_completer = 0
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gt :YcmCompleter GoToType<CR>
nnoremap <D-k>i :YcmCompleter GetDoc<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap go :YcmCompleter OrganizeImports<CR>
nnoremap <Leader>rm :YcmCompleter RefactorRename<CR>

nmap <D-i> <plug>(YCMHover)

" fzf
nnoremap <D-p> :call fzf#run(fzf#wrap({'source': 'fd --type f --follow --exclude .git'}))<CR>
nnoremap <D-f> :BLines<CR>
map <silent> <leader>m :History<CR>

" fugitive git options
set diffopt+=vertical

"ale
let g:ale_fix_on_save = 1

"gitDiff - fugitive
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
nnoremap gdg :diffget<CR>
nnoremap gdp :diffput<CR>
nnoremap gds :Gstatus <bar> :resize 20<CR>

" EASYMOTION
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
