set ignorecase
set nohlsearch
set nu
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set incsearch

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


if exists('g:vscode')
" VSCode extension

call plug#begin()
  Plug 'https://github.com/tpope/vim-surround.git'
  Plug 'easymotion/vim-easymotion'
call plug#end()

map <Leader> <Plug>(easymotion-prefix)

function! s:showCommands()
    normal! gv
    let startLine = line("v")
    let endLine = line(".")
    call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
endfunction

function! s:openVSCodeCommandsInVisualMode()
  normal! gv
  let visualmode = visualmode()
  if visualmode == "V"
      let startLine = line("v")
      let endLine = line(".")
      call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
  else
      let startPos = getpos("v")
      let endPos = getpos(".")
      call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
  endif
endfunction

function! s:copyLinesUpAction()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("editor.action.copyLinesUpAction", startLine, endLine, 1)
endfunction

function! s:copyLinesDownAction()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("editor.action.copyLinesDownAction", startLine, endLine, 1)
endfunction

function! s:moveLinesUpAction()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("editor.action.moveLinesUpAction", startLine, endLine, 1)
endfunction

function! s:moveLinesDownAction()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("editor.action.moveLinesDownAction", startLine, endLine, 1)
endfunction

function! s:indentGroup()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("editor.action.indentLines", startLine, endLine, 1)
endfunction

function! s:outdentGroup()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("outdent", startLine, endLine, 1)
endfunction

function! s:selectTextForPartialDiff()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("extension.partialDiff.markSection1", startLine, endLine, 1)
endfunction

function! s:compareWithSelectedDiff()
  normal! gv
  let startLine = line("v")
  let endLine = line(".")
  call VSCodeNotifyRange("extension.partialDiff.markSection2AndTakeDiff", startLine, endLine, 1)
endfunction

xnoremap <silent> <F2> :<C-u>call <SID>copyLinesUpAction()<CR>
xnoremap <silent> <S-F2> :<C-u>call <SID>copyLinesDownAction()<CR>
xnoremap <silent> <F3> :<C-u>call <SID>moveLinesUpAction()<CR>
xnoremap <silent> <S-F3> :<C-u>call <SID>moveLinesDownAction()<CR>
xnoremap <silent> <F4> :<C-u>call <SID>indentGroup()<CR>
xnoremap <silent> <S-F4> :<C-u>call <SID>outdentGroup()<CR>
xnoremap <silent> <F5> :<C-u>call <SID>selectTextForPartialDiff()<CR>
xnoremap <silent> <S-F5> :<C-u>call <SID>compareWithSelectedDiff()<CR>
xnoremap <leader>b "_

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine


else
" ordinary neovim

call plug#begin()
  Plug 'morhetz/gruvbox'
  Plug 'jremmen/vim-ripgrep'
  Plug 'tpope/vim-fugitive'
  Plug 'leafgarland/typescript-vim'
  Plug 'vim-utils/vim-man'
  Plug 'kien/ctrlp.vim'
  Plug 'Valloric/YouCompleteMe'
  Plug 'https://github.com/tpope/vim-surround.git'
  Plug 'easymotion/vim-easymotion'
call plug#end()


endif
