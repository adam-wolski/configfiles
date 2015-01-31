set t_Co=256
set exrc

colorscheme railscasts
set background=dark

" I took this part from someone long time ago don't remember who for credit :(
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
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
" set textwidth=80            " Lines are automatically wrapped after 80 columns

set ls=2                    " allways show status line
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2            " Always show statusline, even if only 1 window.

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex



set backspace=indent,eol,start

" aby przejscie z insert do normal bylo szybsze
set timeoutlen=1000 ttimeoutlen=0

" Nie zapamietywanie configa przy zapisaniu sesji
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

if has('gui_running')
	:set go-=r
	:set go-=T
	:set go-=m
	:set guiheadroom=0
endif

let mapleader="\<Space>"
""" Skroty klawiszowe

" Reload vimrc
nnoremap <leader>r :so $MYVIMRC

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>

" Paste from clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Te zeby kursor byl na koncu po wklejeniu
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader>/ :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Skroty do chowania interfejsu w gvimie
nnoremap <leader>M :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <leader>T :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>

" " Zmiana navigacji
" nnoremap < ,
" nnoremap , ;
"
" nnoremap j h
" nnoremap k gj
" nnoremap l gk
" nnoremap ; l
"
" vnoremap j <left>
" vnoremap k j
" vnoremap l k
" vnoremap ; l

" window navigation with alt + arrows
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" tab navigation like firefox
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-h> <Esc>:tabprevious<CR>i
inoremap <C-l>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" ctrl o jako ctrlenter w inert mode
inoremap <C-O> <C-o>o

" zeby odpalic makro nagrane jako q
nnoremap Q @q

" Szybki zapis sesji
nnoremap <C-S> :mksession! .vimsession.vim

" imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
" smap <C-J> <Plug>snipMateNextOrTrigger
let g:UltiSnipsExpandTrigger='<c-s>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

nmap s <Plug>(easymotion-s2)
nmap <Leader>s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <Leader>f <Plug>(easymotion-f)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1

nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_auto_start_csharp_server = 1
let g:ycm_auto_stop_csharp_server = 1
let g:ycm_csharp_server_port = 2000

