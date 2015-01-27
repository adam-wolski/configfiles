set encoding=utf-8

call plug#begin()

" Navigation
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'

" Completation
Plug 'Valloric/YouCompleteMe'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" Error Checking
Plug 'scrooloose/syntastic'

" Visual
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'chankaward/vim-railscasts-theme'

" Other
Plug 'tpope/vim-eunuch'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'

call plug#end()

source ~/mgit/configfiles/vimsettings.vim

" Sudo write
cmap w!! SudoWrite

set mouse=a

nmap <F5> :!python %<CR>
nmap <F6> :!python2 %<CR>

let g:ycm_global_ycm_extra_conf = '~/mgit/configfiles/ycm_extra_conf.py'
