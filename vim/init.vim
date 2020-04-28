call plug#begin()
	Plug 'skywind3000/asyncrun.vim'
	Plug 'jaxbot/semantic-highlight.vim'
    	Plug 'junegunn/fzf'
    	Plug 'junegunn/fzf.vim'
    	Plug 'junegunn/goyo.vim'
    	Plug 'adam-wolski/FindEverything'
    	Plug 'luochen1990/rainbow'
    	Plug 'equalsraf/neovim-gui-shim'
    	Plug 'beyondmarc/hlsl.vim'
    	Plug 'PProvost/vim-ps1'
    	Plug 'jiangmiao/auto-pairs'
    	Plug 'tpope/vim-surround'
    	Plug 'tpope/vim-fugitive'
    	Plug 'tpope/vim-eunuch'
call plug#end()

set exrc
set nowrap
set ignorecase

let mapleader = "\<Space>"

let g:rainbow_active = 1

" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

let g:goyo_width = 150
let g:goyo_height = '100%'

colorscheme evening

nmap <Leader>tsh :SemanticHighlightToggle<CR>
nmap <Leader>s :SemanticHighlight<CR>
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>/ :nohl<CR>
nmap <C-j> 10j<CR>
nmap <C-k> 10k<CR>
nmap <C-p> :Files<CR>

map <Leader>y "+y
map <Leader>p "+p

autocmd FileType cpp,h SemanticHighlight
