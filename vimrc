set encoding=utf-8
set nocompatible              " be iMproved
filetype off                  " required!
syntax enable

" komentuje bo chyba nie potrzebuje teraz na archu set rtp+=~/git/powerline/powerline/bindings/vim
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
execute pathogen#infect()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" Optional:
Bundle "honza/vim-snippets"
Bundle 'Raimondi/delimitMate'

Bundle 'scrooloose/nerdtree'

Bundle 'tpope/vim-dispatch'

Bundle 'wincent/Command-T'

Bundle 'lambdalisue/vim-django-support'

" Bundle 'Lokaltog/powerline'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'altercation/vim-colors-solarized'
" Bundle 'wincent/Command-T'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ"
" NOTE: comments after Bundle commands are not allowed.

source ~/mgit/configfiles/vimsettings.vim

let g:ycm_path_to_python_interpreter = '/usr/bin/python2'

"Jezeli zapomniales sudo w!!
cmap w!! w !sudo tee % >/dev/null

" szatan ?
set mouse=a

if has('gui_running')
	set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
endif

nmap <F5> :!python2 %<CR>
nmap <F6> :!python3 %<CR>

vnoremap <F5> :!python2<CR>
vnoremap <F6> :!python3<CR>

source ~/.vim/djangodetect.vim 
autocmd FileType python call FindDjangoSettings2()
