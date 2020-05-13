"Plug 'lyuts/vim-rtags'

"autocomplete
Plug 'Valloric/YouCompleteMe'

"undotree
Plug 'mbbill/undotree'

"ctrl p search in project
Plug 'kien/ctrlp.vim'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>

  map <D-t> :CommandT<CR>
  map <D-h> <Home>
  map <D-l> <End>
  map <A-l> <End>
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0

nnoremap <leader>w :wincmd q<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

"window navigation"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"end of the lines WIP
nnoremap <D-H> <Home>
nnoremap <D-L> <End>
nnoremap <A-l> <End>
nnoremap <M-h> b

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
