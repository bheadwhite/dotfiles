set ignorecase smartcase
set nohlsearch
set lazyredraw
set backspace=indent,eol,start
set nu
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set noswapfile
set incsearch
set timeoutlen=1000 ttimeoutlen=0

set colorcolumn=100
highlight ColorColumn ctermbg=8

colorscheme gruvbox

let mapleader = " "

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


call plug#begin()
  Plug 'tpope/vim-surround.git'
  Plug 'easymotion/vim-easymotion'
  Plug 'mbbill/undotree'
call plug#end()

source ~/Desktop/code/dotfiles/vscodeFunctions.vim

map <leader> <Plug>(easymotion-prefix)

xnoremap <silent> <S-F2> :<C-u>call <SID>copyLinesDownAction()<CR>
xnoremap <silent> <F2> :<C-u>call <SID>copyLinesUpAction()<CR>
xnoremap <silent> <F3> :<C-u>call <SID>moveLinesUpAction()<CR>
xnoremap <silent> <S-F3> :<C-u>call <SID>moveLinesDownAction()<CR>
xnoremap <silent> <F5> :<C-u>call <SID>selectTextForPartialDiff()<CR>
xnoremap <silent> <S-F5> :<C-u>call <SID>compareWithSelectedDiff()<CR>
xnoremap <leader>b "_
xnoremap <leader>gd :<C-u>call <SID>openToTheSide()<CR>

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine