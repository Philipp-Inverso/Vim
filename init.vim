let g:python3_host_prog='C:\Users\pme\AppData\Local\Programs\Python\Python37-32\python.exe'

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf'
Plug 'lervag/vimtex'
Plug 'machakann/vim-sandwich'
Plug 'majutsushi/tagbar'
Plug 'mkitt/tabline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/argtextobj.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'

call plug#end()

" general settings
set number
set encoding=utf-8
set undodir=~/Neovim/undodir
set undofile
set clipboard+=unnamed
set termguicolors

set background=dark
colorscheme solarized

" setup deoplete
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

let g:deoplete#enable_at_startup = 1

" setup NERDTree
autocmd VimEnter * NERDTree

" setup Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" setup airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled=1
