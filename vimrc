"
" =====================================
"               Init
" =====================================
"
let g:author='Adam Wolski'
let g:email='miniupuchaty@gmail.com'
let g:github='https://github.com/miniukov'

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
set backspace=indent,eol,start
if has('unix')
        set dir=~/tmp/vim           " Directory for .swp files
endif

if has('unix')                      " Read config folder location from env
        let CONFIG_FOLDER=$CONFIG_FOLDER    
else
        if has('win32')             " Hardcode it for windows for now
                let $CONFIG_FOLDER='C:\\git\\configfiles'
        endif
endif

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
Plug 'derekwyatt/vim-fswitch', { 'on': 'FSHere'}

" Completation
Plug 'ervandew/supertab', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --clang-completer --racer-completer --system-libclang --system-boost', 'for': ['c', 'cpp', 'haskell', 'clojure', 'rust']}
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
" Plug 'Raimondi/delimitMate'  " Was giving problems trying auto-pairs for now
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" Error Checking
Plug 'scrooloose/syntastic'

" Visual
" Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides', { 'on': 'IndentGuidesToggle' }
Plug 'jaxbot/semantic-highlight.vim'
Plug 'kien/rainbow_parentheses.vim'

" Language specific
Plug 'beyondmarc/opengl.vim', { 'for': ['c', 'cpp'] }
Plug 'LucHermitte/VimFold4C', { 'for': ['c', 'cpp'] }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'chankaward/vim-railscasts-theme'
Plug 'jaapie/vim-colours-dusk'
Plug 'Wutzara/vim-materialtheme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'gosukiwi/vim-atom-dark'

" Other
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
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
nnoremap <leader>tb :TagbarOpenAutoClose<cr>


""            Number Toggle
" Shortcut
let g:NumberToggleTrigger="<leader>nt"


""              UltiSnips
" Snippets variables
let g:snips_author='Adam Wolski'
let g:snips_email='miniupuchaty@gmail.com'
let g:snips_github='https://github.com/miniukov'
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

""              SuperTab
" Settings
let g:SuperTabDefaultCompletionType = "<c-n>"   " Make tab go from top to bottom

""              JediVim
"
if has('nvim') || has('win32')
        let g:jedi#goto_command = "<leader>d"
        let g:jedi#goto_assignments_command = "<leader>g"
        let g:jedi#goto_definitions_command = ""
        let g:jedi#documentation_command = "K"
        let g:jedi#usages_command = "<leader>n"
        let g:jedi#completions_command = "<C-Space>"
        let g:jedi#rename_command = "<leader>r"
endif

""              YouCompleteMe
" Shortcut
nnoremap <leader>d :YcmCompleter GoTo<CR>
let g:ycm_global_ycm_extra_conf = "~/.config/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0                " Don't ask about ycm extra conf
let g:ycm_complete_in_comments = 1              " Complete in comments
let g:ycm_rust_src_path = '/usr/local/rust/rustc-1.5.0/src'

""             Semantic Highlight
" Settings
source $CONFIG_FOLDER/semanticHighlightPluginSettings.vim
" let g:semanticGUIColors = [ '#EF5350', '#64B5F6', '#9575CD', '#7986CB', '#4FC3F7', '#29B6F6', '#81D4FA', '#80DEEA', '#80CBC4', '#9CCC65', '#E57373', '#CE93D8', '#B39DDB', '#7986CB', '#64B5F6', '#90CAF9', '#C5CAE9', '#536DFE', '#448AFF', '#4FC3F7', '#81D4FA', '#40C4FF', '#81C784', '#26A69A' , '#4DB6AC', '#80CBC4' ]
if has('gui_running') || has('nvim')
        let g:semanticGUIColors = [ "#BBDEFB", "#64B5F6", "#B39DDB", "#B39DDB", "#B39DDB", "#64B5F6", "#B39DDB", "#64B5F6", "#BBDEFB", "#90CAF9", "#90CAF9", "#64B5F6", "#64B5F6", "#90CAF9", "#B39DDB", "#B39DDB", "#BBDEFB", "#90CAF9", "#64B5F6", "#B39DDB", "#90CAF9", "#BBDEFB", "#BBDEFB", "#64B5F6", "#64B5F6", "#90CAF9" ]
else
        let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]
        let g:semanticTermColors = [1,31,32,33,34,35,36,37,41,42,43,44,45,46,47,91,95,97,101,105]
endif

""                  CtrlP
" Settings
nnoremap <C-B> :CtrlPBuffer<CR>
nnoremap <C-P> :CtrlP<CR>

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

set background=dark         " Dark background by default
set showmatch               " Show matching parentesis
set cursorline              " Have a line indicate the cursor location
set wrap                    " Wrap text
set linebreak               " But don't wrap text in the middle of a word

set noerrorbells            " Don't bell or blink
set vb t_vb=                " 

colorscheme solarized       " Theme for non gui, overwritten in next if

" GUI settings
if has('gui_running') || has('nvim')
	:set go-=r
	:set go-=T
	:set go-=m
	:set guiheadroom=0
    :set guifont=Source\ Code\ Pro\ Ultra-Light\ 16
    colorscheme nTheme
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
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>


""
"" Neovim terminal mode
""
if has('nvim')
" Start/Exit
        nnoremap <leader>t :vsp term://zsh<CR>
        tnoremap <C-e> <C-\><C-n>
" window navigation
        tnoremap <C-h> <C-\><C-n><C-w>h
        tnoremap <C-j> <C-\><C-n><C-w>j
        tnoremap <C-k> <C-\><C-n><C-w>k
        tnoremap <C-l> <C-\><C-n><C-w>l
endif


""
"" Other
""

" Add ; on end line
inoremap <C-t> <ESC>$a;

" Paste from clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

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
au FileType python set sts=4 ts=4 sw=4 colorcolumn=80
au FileType python nnoremap <F8> :!pep8 %<CR>
