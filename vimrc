" plugins
call plug#begin('~/.vim/plugged')
" look of vim
"Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
" helpers
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
" language specific things
Plug 'fatih/vim-go'
Plug 'othree/yajs.vim'
Plug 'OrangeT/vim-csharp'
Plug 'justbrettjones/vim-swigjs'
call plug#end()

" Ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

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

" NERDTree things
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 55
" close vim if NERDTree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" undotree stuff
let g:undotree_SplitWidth = 55

" set relative numbers
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" set colorscheme
if has('gui_running')
  set guifont=Hack:h11
endif

colorscheme molokai
"set background=dark
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

" undotree toggle
nnoremap <F6> :UndotreeToggle<cr>

" get rid of the mouse
noremap <ScrollWheelUp>      <nop>
noremap <S-ScrollWheelUp>    <nop>
noremap <C-ScrollWheelUp>    <nop>
noremap <ScrollWheelDown>    <nop>
noremap <S-ScrollWheelDown>  <nop>
noremap <C-ScrollWheelDown>  <nop>
noremap <ScrollWheelLeft>    <nop>
noremap <S-ScrollWheelLeft>  <nop>
noremap <C-ScrollWheelLeft>  <nop>
noremap <ScrollWheelRight>   <nop>
noremap <S-ScrollWheelRight> <nop>
noremap <C-ScrollWheelRight> <nop>

" make
noremap <F9> :make<CR>

" go
let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
