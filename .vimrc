source ~/.vundle.vim
source ~/.srcexpl.vim
source ~/.cscope_maps.vim
source ~/.taglist.vim


set number
hi Search ctermbg=red
hi Search ctermfg=white
set hlsearch
set colorcolumn=80

set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

vmap <C-C> "+y

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
