"""Mine Settings

" let g:CSApprox_loaded = 1
set t_Co=256

colorscheme solarized
set background=dark

syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" don't bell or blink
set noerrorbells
set vb t_vb=

set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set showmatch               " Briefly jump to a paren once it's balanced
set wrap                    " Wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
" set tabstop=4               " <tab> inserts 4 spaces 
" set shiftwidth=4            " but an indent level is 2 spaces wide.
" set softtabstop=4           " <BS> over an autoindent deletes both spaces.
" set expandtab               " Use spaces, not tabs, for autoindent/tab key.
" set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
" set textwidth=80            " Lines are automatically wrapped after 80 columns

set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
" set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex



set backspace=indent,eol,start

" aby przejscie z insert do normal bylo szybsze 
set timeoutlen=1000 ttimeoutlen=0

if has('gui_running')
	:set go-=r
	:set go-=T
	:set go-=m
endif


let mapleader=","             " change the leader to be a comma vs slash
""" Skroty klawiszowe

" Reload vimrc
nnoremap <leader>r :so $MYVIMRC

" Paste from clipboard
map <leader>p "+p
map <leader>y "+y

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Skroty do chowania interfejsu w gvimie
nnoremap <leader>M :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR> 
nnoremap <leader>T :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>



" Zmiana navigacji

nnoremap j h
nnoremap k gj
nnoremap l gk
nnoremap ; l

vnoremap j <left>
vnoremap k j
vnoremap l k
vnoremap ; l


" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" window navigation with alt + arrows
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-l> :wincmd j<CR>
nmap <silent> <A-j> :wincmd h<CR>
nmap <silent> <A-;> :wincmd l<CR>

" ctrl o jako ctrlenter w inert mode
inoremap <C-O> <C-o>o
inoremap <C-K> <C-o>o
inoremap <C-L> <C-o>O

" zeby odpalic makro nagrane jako q 
nnoremap Q @q 

" Spacja do insert mode
nmap <S-Space> i <Esc>

" Spacja do komend
nnoremap <Space> :

" Shift + Enter nowa linia bez wchodzenia do inserta
"nnoremap <S-Enter> O<Esc> 
"nnoremap <CR> o<Esc>

imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

map <C-n> :NERDTreeToggle<CR>

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>j <Plug>(easymotion-lineforward)
map <Leader>k <Plug>(easymotion-j)
map <Leader>l <Plug>(easymotion-k)
map <Leader>; <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1

nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_auto_start_csharp_server = 1
let g:ycm_auto_stop_csharp_server = 1
let g:ycm_csharp_server_port = 2000

" zaladuj rainbow parentheses:
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
