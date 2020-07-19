source ~/.vundle.vim
source ~/.srcexpl.vim
source ~/.cscope_maps.vim
source ~/.taglist.vim


set number
hi Search ctermbg=red
hi Search ctermfg=white
set hlsearch
set colorcolumn=80
syntax on

"set foldmethod=indent
"set foldnestmax=10
"set nofoldenable
"set foldlevel=2

vmap <C-C> "+y

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set background=dark
set t_Co=256!
set ignorecase
set pastetoggle=<F3>
"show full path of a file
set statusline+=%F

"set expandtab
"1 tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
colorscheme koehler
filetype plugin indent on
set relativenumber
set mouse=a
