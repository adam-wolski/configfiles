set encoding=utf-8

" NeoBundle Start
filetype off                  " required!
syntax enable

if has('vim_starting')
  set nocompatible               " Be iMproved
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'kien/rainbow_parentheses.vim' 
NeoBundle "honza/vim-snippets"
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'lambdalisue/vim-django-support'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'terryma/vim-expand-region'

filetype plugin indent on     " required!
NeoBundleCheck
" NeoBundle End

source ~/mgit/configfiles/vimsettings.vim

let g:ycm_path_to_python_interpreter = '/usr/bin/python2'

"Jezeli zapomniales sudo w!!
cmap w!! w !sudo tee % >/dev/null

" szatan ?
set mouse=a

if has('gui_running')
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
endif

nmap <F5> :!python2 %<CR>
nmap <F6> :!python3 %<CR>

vnoremap <F5> :!python2<CR>
vnoremap <F6> :!python3<CR>

source ~/mgit/configfiles/better-django-detection.vim
autocmd FileType python call FindDjangoSettings2()

" Przyspieszenie ctrl p dla projektow w gitcie
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
