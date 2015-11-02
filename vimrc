" plugins
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'editorconfig/editorconfig-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'KabbAmine/gulp-vim'
call plug#end()

let NERDTreeShowHidden=1

set nocompatible
set laststatus=2

syntax enable
filetype plugin indent on

set hidden
set backspace=indent,eol,start
set history=100
set number

" \rr opens .vimrc
map <leader>rr :source ~/.vimrc<CR>

set background=dark
colorscheme solarized

" disbale arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" set relative numbers
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" column markers
" highlight ColorColumn ctermbg=magenta
" call matchadd('ColorColumn', '\%101v', 100)
:au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
