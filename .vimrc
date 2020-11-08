source ~/.vundle.vim
source ~/.srcexpl.vim
source ~/.cscope_maps.vim
source ~/.taglist.vim

set rtp+=~/.fzf

syntax on
set number
hi Search ctermbg=red
hi Search ctermfg=white
set hlsearch
set colorcolumn=80

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
nmap cp :let @" = expand("%:p")<cr>

set background=dark
set t_Co=256
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
set autoindent
set mouse=a
highlight ColorColumn ctermbg=8

if &diff
    colorscheme evening
    highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
    highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif

" Make prefix , suffix character in vim are visible
" set list

"git add with F1 key
func GitAdd()
    silent !clear
    execute "!git add" expand("%:p") "&&" "echo add" expand("%:p") "successfully"
endfunction
nnoremap <F1> :call GitAdd()<cr>

"func show trailing spaces

let g:showTrailingEnabled = 1

func ShowTrailingSpace()
    if g:showTrailingEnabled
        highlight ExtraWhitespace ctermbg=8
        match ExtraWhitespace /\s\+$/
        let g:showTrailingEnabled = 0
    else
        match
        let g:showTrailingEnabled = 1
    endif
endfunction

call ShowTrailingSpace()

nnoremap <F2> :set list!<cr>
nnoremap <F3> :call ShowTrailingSpace()<cr>

let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
