" plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
" look of vim
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
" helpers
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --racer-completer', 'for': ['rust','go'] }
Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'rizzatti/dash.vim'
" language specific things
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'othree/yajs.vim'
Plug 'OrangeT/vim-csharp'
Plug 'justbrettjones/vim-swigjs'
call plug#end()

" Ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" NERDTree things
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 55
" close vim if NERDTree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" set relative numbers
set relativenumber

" set colorscheme
if has('gui_running')
  set guifont=Hack:h11
else
  let g:solarized_termtrans=1
endif

colorscheme solarized
set background=dark
let g:airline_powerline_fonts = 1

" column markers
highlight ColorColumn guibg=magenta guifg=white ctermbg=magenta ctermfg=white
:call matchadd('ColorColumn', '\%101v', 100)

" diable session autosave
let g:session_autosave = 'no'

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

" tagebar
noremap <F8> :TagbarToggle<CR>

" make pane movement simpler
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" go
let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
