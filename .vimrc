syntax enable on

set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
highlight ColorColumn ctermbg=8
set timeoutlen=1000 ttimeoutlen=0
set ignorecase smartcase
set noerrorbells visualbell t_vb=
set number relativenumber cursorline nowrap lazyredraw nohlsearch
set splitright splitbelow colorcolumn=100 equalalways eadirection=hor
set nobackup noswf autoread< mouse=a updatetime=50
set undodir=~/.vim/undodir"
set undofile
set t_Co=256

"colors
if (has("termguicolors"))
  set termguicolors
endif

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
set shortmess+=c
call plug#begin()

"colorschemes
Plug 'joshdick/onedark.vim'
"Plug 'morhetz/gruvbox'
"Plug 'dikiaap/minimalist' "color scheme
"Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'Brettm12345/moonlight.vim'
"Plug 'sainnhe/sonokai'


"editing
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --ts-completer' }
"Plug 'Quramy/tsuquyomi' "completion engine
"Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
"Plug 'jiangmiao/auto-pairs'
"Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'raimondi/delimitmate'
"Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'

" git
Plug 'tpope/vim-fugitive'
"Plug 'junegunn/gv.vim' "git looking at commit browser
Plug 'airblade/vim-gitgutter'

" Syntax Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'

"Plug 'vim-utils/vim-man'

Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
"Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'

"Plug 'vim-scripts/xptemplate' "code snippet engine
"Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
"Plug 'gcmt/taboo.vim'
Plug 'w0rp/ale'
"Plug 'Valloric/MatchTagAlways'
"Plug 'ntpeters/vim-better-whitespace'
Plug 'fatih/vim-go'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'airblade/vim-rooter'
Plug 'ap/vim-css-color'
"Plug 'yuttie/comfortable-motion.vim'
"Plug 'mhinz/vim-startify'
"Plug 'wesQ3/vim-windowswap'
Plug 'itchyny/lightline.vim'

call plug#end()

let mapleader = " "

colorscheme onedark

set background=dark

let g:netrw_browse_split = 2
let g:netrw_winsize = 25
let delimitMate_jump_expansion = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

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
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" faster pane switching/window management
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap L $
nnoremap H ^
nnoremap <M-h> b
nnoremap <M-l> e
imap <M-BS> <C-w>
inoremap <S-TAB> <C-o>a

map <D-w> :q<CR>

nnoremap <D-L> <C-W>L
nnoremap <D-H> <C-W>H
inoremap <D-l> <C-o>a
inoremap <d-h> <C-o>i

map <Leader>v :vsp <bar> wincmd =<CR>

" saving
"map <D-s> :w <bar> :!echo saved"<CR>

" resizing windows
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

inoremap <D-s> :echo "test"<CR>

" nerdtree
map <leader>k :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>

" undo tree
map <leader>u :UndotreeToggle<CR>

" fzf
"nnoremap <D-p> :call fzf#run(fzf#wrap({'source': 'fd --type f --follow --exclude .git'}))<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :BLines<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>` :e ~/.config/nvim/init.vim<CR>
map <silent> <leader>m :History<CR>

" COC
 " GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)

nmap <silent> <leader>g <Plug>(coc-diagnostic-next)

nnoremap <leader>cf :CocFix<CR>
nnoremap <leader>cr :CocRestart<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :<C-u>call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

nnoremap <silent> <M-i> :<C-u>call <SID>show_hover_doc()<CR>

" fugitive git options
set diffopt+=vertical

"ale
let g:ale_fix_on_save = 1

"gitDiff - fuGITive
 nmap <leader>gh :diffget //3<CR>
 nmap <leader>gu :diffget //2<CR>
 nmap <leader>gs :G<CR>


"" EASYMOTION
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
