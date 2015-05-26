"
" =====================================
"               Init
" =====================================
"

set encoding=utf-8
set exrc                            " Load vimrc from current dir
set hidden                          " Hide buffer instead of closing it
syntax on                           " Enable syntax highlighting
filetype on                         " Detect filetypes
filetype plugin indent on           " Enable loading indent file for filetype
set number                          " Display line numbers
set title                           " Show title in console title bar
set mouse=a                         " Mouse, sometimes usefull
set timeoutlen=1000 ttimeoutlen=0   " Faster insert to normal jump
set nofoldenable                    " Disable folds on start, toggle with zi
set wildmenu                        " Menu completion in command mode on <Tab>
set wildmode=full                   " <Tab> cycles between all matching choices.


let CONFIG_FOLDER=$CONFIG_FOLDER    " Read config folder location from env

let mapleader="\<Space>"            "Set leader shortcut to spacebar

"
" =====================================
"               Plugins
" =====================================
"

""
"" Load plugins
""

call plug#begin()

" Navigation
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'derekwyatt/vim-fswitch'

" Completation
Plug 'Valloric/YouCompleteMe'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Error Checking
Plug 'scrooloose/syntastic'

" Visual
" Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'kien/rainbow_parentheses.vim'

" Language specific
Plug 'beyondmarc/opengl.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'rust-lang/rust.vim'
Plug 'LucHermitte/VimFold4C'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'chankaward/vim-railscasts-theme'
Plug 'jaapie/vim-colours-dusk'

" Other
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'sjl/gundo.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()

""
"" Plugin configuration
""

""               Eunch
" Sudo write
cmap w!! SudoWrite

""              Fugitive
" Shortcuts
noremap <leader>gd :Gdiff<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gw :Gwrite<CR>


""              FSwitch
" Shortcut
nnoremap <leader>fs :FSHere<cr>
" Custom file bindings
au! BufEnter *.frag let b:fswitchdst = 'vert' | let b:fswitchlocs = '.'
au! BufEnter *.vert let b:fswitchdst = 'frag' | let b:fswitchlocs = '.'


""              Tagbar
" Shortcut
nnoremap <leader>tb :TagbarToggle<cr>


""            Number Toggle
" Shortcut
let g:NumberToggleTrigger="<leader>nt"


""              UltiSnips
" Shortcuts
let g:UltiSnipsExpandTrigger='<c-s>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'


""          Rainbow Parentheses
" Shortcut
nmap <leader>rp :RainbowParenthesesToggle <cr>
" Settings
au VimEnter * RainbowParenthesesToggle          " Toggle on by default
au Syntax * RainbowParenthesesLoadRound         " Apply for all kinds of parentheses
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


""              Easymotion
" Shortcuts
nmap <Leader>s <Plug>(easymotion-s2)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
map <Leader>f <Plug>(easymotion-f)
map <Leader>F <Plug>(easymotion-F)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0                " Keep cursor column when in JK motion
let g:EasyMotion_smartcase = 1


""              YouCompleteMe
" Shortcut
nnoremap <leader>d :YcmCompleter GoTo<CR>
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0                " Don't ask about ycm extra conf


""             Semantic Highlight
" Settings
source $CONFIG_FOLDER/semanticHighlightPluginSettings.vim


" 
" =====================================
"               Editing 
" =====================================
"


set autoindent              " Keep indent of last line
set smartindent             " Use smart indent if there is no indent file
set scrolloff=5             " Keep x context lines above and below the cursor
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set tabstop=4               " <tab> inserts x spaces
set textwidth=90            " Lines are automatically wrapped after x columns


"
" =====================================
"              Searching
" =====================================
"


set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex


"
" =====================================
"               Visual
" =====================================
"
"

colorscheme railscasts


set background=dark         " Dark background by default
set showmatch               " Show matching parentesis
set cursorline              " Have a line indicate the cursor location
set wrap                    " Wrap text
set linebreak               " But don't wrap text in the middle of a word

set noerrorbells            " Don't bell or blink
set vb t_vb=                " 

" GUI settings
if has('gui_running')
	:set go-=r
	:set go-=T
	:set go-=m
	:set guiheadroom=0
    :set guifont=Monospace\ 9
endif



"
" =====================================
"               Shortcuts
" =====================================
"

""
"" File/Windows operations 
""

" Write file
nnoremap <Leader>w :w<CR>

" Quit window
nnoremap <leader>q :q<CR>

" Save session
nnoremap <C-S> :mksession! .vimsession.vim


""
"" Navigation
""

" Line Navigation, so it moves line down/up even with wrapping
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" window navigation
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>


""
"" Other
""

" Add ; on end line
imap <C-t> <ESC>$a;

" Paste from clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Take cursor to end of pasted line
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" hide matches on <leader>space
nnoremap <leader>/ :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Add new line in insert mode
inoremap <C-O> <C-o>o

" Rebind macro playback
nnoremap Q @

" Handy shortcut for macro named q
nnoremap QQ @q


"
" =====================================
"          Filetype Specific
" =====================================
"

" Override setting for .h files, which default to cpp for me.
au BufRead,BufNewFile *.h set filetype=c

" Make Python follow PEP8
au FileType python set sts=4 ts=4 sw=4 tw=79

