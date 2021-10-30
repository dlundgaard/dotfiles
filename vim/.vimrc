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

colorscheme codedark
hi Normal guibg=NONE ctermbg=NONE
hi MatchParen cterm=underline ctermbg=none ctermfg=cyan

inoremap <C-d> <Esc>
nnoremap <C-s> <Esc>:w<CR>
vnoremap <silent> <leader>y :w !clip.exe<CR><CR>
nnoremap Å O<Esc>j
nnoremap <leader>ale :ALEToggle<CR>

" disable ALE by default
let g:ale_enabled=0
" Load all plugins.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
