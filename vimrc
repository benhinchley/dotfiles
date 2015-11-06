" plugins
call plug#begin('~/.vim/plugged')
" look of vim
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
" helpers
Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'
" language specific things
Plug 'fatih/vim-go'
call plug#end()

set nocompatible
set laststatus=2

set ffs=unix,dos

syntax enable
filetype plugin indent on

set hidden
set backspace=indent,eol,start
set history=100
set number

set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 55
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" set relative numbers
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" set colorscheme
if has('gui_running')
  set guifont=Hack:h11
endif

colorscheme solarized
set background=dark
let g:airline_powerline_fonts = 1

" column markers
highlight ColorColumn guibg=magenta guifg=white ctermbg=magenta ctermfg=white
:call matchadd('ColorColumn', '\%101v', 100)

" KEY REMAPS
" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" make semicolon colon and vice versa
nnoremap ; :
nnoremap : ;

" NERDtree toggle
nnoremap <C-n> :NERDTreeToggle<CR>

" go
let g:go_fmt_command = "goimports"
