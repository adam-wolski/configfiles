set encoding=utf-8

call plug#begin()

Plug 'bling/vim-airline'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-eunuch'
" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'chankaward/vim-railscasts-theme'

call plug#end()

source ~/mgit/configfiles/vimsettings.vim

" Sudo write
cmap w!! SudoWrite

set mouse=a

nmap <F5> :!python %<CR>
nmap <F6> :!python2 %<CR>
