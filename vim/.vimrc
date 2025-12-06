syntax on

set nocompatible
set cursorline
set number
set relativenumber
set mouse+=a
set showcmd
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set smartcase
set laststatus=2
set visualbell
set noswapfile
set dir=/tmp
set undodir=/tmp
set backupdir=/tmp
set cursorline

hi Normal guibg=NONE ctermbg=NONE
hi MatchParen cterm=underline ctermbg=none ctermfg=cyan

inoremap <C-d> <Esc>
nnoremap <C-s> <Esc>:w<CR>
nnoremap Å O<Esc>j
