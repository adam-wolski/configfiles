call plug#begin()
	Plug 'jaxbot/semantic-highlight.vim'
    	Plug 'junegunn/fzf'
    	Plug 'junegunn/fzf.vim'
    	Plug 'luochen1990/rainbow'
    	Plug 'equalsraf/neovim-gui-shim'
    	Plug 'beyondmarc/hlsl.vim'
    	Plug 'jiangmiao/auto-pairs'
call plug#end()

set exrc
set nowrap
set ignorecase
set hidden
set scrolloff=15

let mapleader = "\<Space>"
let &grepprg = "rg --vimgrep"
let g:rainbow_active = 1
let g:fzf_preview_window = '' 	" Disable preview window

colorscheme evening

nmap <Leader>ts :SemanticHighlightToggle<CR>
nmap <Leader>s :SemanticHighlight<CR>
nmap <Leader>/ :nohl<CR>
nmap <C-p> :Files<CR>

autocmd FileType cpp,h SemanticHighlight
