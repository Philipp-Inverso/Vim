" TODO: Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrboesch/vim-tabline'
Plug 'airblade/vim-gitgutter'

call plug#end()

" ##############################
" ###### GENERAL SETTINGS ######
" ##############################
set nocompatible
syntax on
set encoding=utf-8
set tabstop=2 shiftwidth=2 softtabstop=2 shiftround expandtab

" show extra whitespace (leading <tab>, trailing whitespace)
set list listchars=tab:»·,trail:·,nbsp:·

" line numbering
set number relativenumber
autocmd InsertEnter * :se norelativenumber
autocmd InsertLeave * :se relativenumber

" theme
colorscheme desert

" copy to and from System-Clipboard
set clipboard+=unnamed

" reload vimrc on save
autocmd! bufwritepost ~/AppData/Local/nvim/init.vim source %

" Make it obvious where 80 characters is TODO better
set textwidth=80
" set colorcolumn=+1

" Always use vertical diffs
set diffopt+=vertical

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" disable arrow-keys
nnoremap <left> <Nop>
nnoremap <right> <Nop>
nnoremap <up> <Nop>
nnoremap <down> <Nop>

" TODO: enableable
" inoremap <left> <Nop>
" inoremap <right> <Nop>
" inoremap <up> <Nop>
" inoremap <down> <Nop>

" find cursor with \c
:highlight CursorLine cterm=None ctermfg=darkred ctermbg=blue guifg=darkred guibg=blue
:highlight CursorColumn cterm=None ctermfg=darkred ctermbg=gray guifg=darkred guibg=gray
:nnoremap <Leader>c :set CursorLine! CursorcoLumn!<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" automatically enable/ disable highlightsearch
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" TODO ???
" set undodir=~/Neovim/undodir
" set undofile

" Tab completion  TODO: understand!!
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" ################
" ### Spelling ###
" ################

" '[s' / ']s'	: jump between misspelled words
" 'zg' / 'zw'	: mark word as good/ wrong
" 'zG' / 'zW'	: mark word as good/ wrong temporarily
" 'z='	: show suggestions
set spell
set spelllang=de,en
set complete+=kspell
autocmd FileType python set omnifunc+=pythoncomplete#Complete,python3complete#Complete

" #####################
" ### FINDING FILES ###
" #####################

" search all subfolders (recursively)
set path+=**
" Display all matching files when tab-complete
set wildmenu

" ###################
" ### TAG JUMPING ###
" ###################

" create 'tags' file
" ^]	: jump to definition
" ^t	: go back in jump stack
command! MakeTags !ctags -R .

" ####################
" ### AUTOCOMPLETE ###
" ####################

" tabcompletion enabled
" doc: |ins-completion|
" ^x^n		: search JUST this file
" ^x^f		: search for filenames
" ^x^]		: search tags only
" ^n / ^p	: complete (next/prev)

" #####################
" ### FILE BROWSING ###
" #####################

" open tabs with 'tabnew'
" switch tabs with 'gt' / 'gT'

" ':edit FOLDER'	: open file browser
" '<CR>' / 'v' / 't'	: open / open in v-split / open in new tab
" ':help netrw-browse-maps'	: for info
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.='.\(^\|\s\s\)\zs\.\S\*'

" #############
" SNIPPETS
" #############
" nnoremap command(e.g. ,html) :-1read %HOME/Neovim/snippets/FILE<CR>_further_executed_keystrokes

let snippet_path="~/AppData/Local/nvim/snippets"
nnoremap \python :-1read ~/AppData/Local/nvim/snippets/skeleton.py<CR>o
" nnoremap \java :-1read $HOME/Neovim/snippets/skeleton.java<CR>

" #############
" BUILD INTEGRATION
" #############
"
" http://philipbradley.net/posts/rspec-into-vim-with-quickfix
" set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

" ####################################################################################################
" PLUGIN SETTINGS
" ###################################################################################################

" #############
" Markdown Preview
" #############
" automatically open Preview when entering Markdown Buffer
let g:mkdp_auto_start = 1

" #############
" Airline
" #############
let g:airline#extensions#tabline#enabled = 1
let g:airline_right_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_right_alt_sep = '|'

let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" ##############################
" ############ TIPS ############
" ##############################
"
" :@"<CR>     Execute yanked command
