call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'

Plug 'mhinz/vim-startify'

"Plug 'benhinchley/ghost'
Plug '~/Repositories/ghost'
Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'bronson/vim-trailing-whitespace'

Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar', { 'for': ['go', 'rust'] }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --racer-completer'}

Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

Plug 'rizzatti/dash.vim'

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'fatih/vim-hclfmt', { 'for': 'tf' }
call plug#end()

" ctrl-p
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" NERDTree things
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 55
" close vim if NERDTree is the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" set relative numbers
set relativenumber
augroup toggle_relative_number
    autocmd!
    autocmd InsertEnter * :setlocal norelativenumber
    autocmd InsertLeave * :setlocal relativenumber
augroup END

" persitant undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undodir
endif

" set colorscheme
if has('gui_running')
  set guifont=Hack:h11
endif

set background=dark
colorscheme ghost

" airline
let g:airline_theme='ghost'
let g:airline_powerline_fonts=0

" remove scrollbars
if has('gui_running')
  set guioptions-=r
  set guioptions-=L
endif

" column markers
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

"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
