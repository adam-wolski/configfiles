call plug#begin()
	Plug 'jaxbot/semantic-highlight.vim'
    	Plug 'junegunn/fzf'
    	Plug 'junegunn/fzf.vim'
    	Plug 'luochen1990/rainbow'
    	Plug 'equalsraf/neovim-gui-shim'
    	Plug 'beyondmarc/hlsl.vim'
    	Plug 'jiangmiao/auto-pairs'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'jackguo380/vim-lsp-cxx-highlight'
	Plug 'sheerun/vim-polyglot'
	Plug 'tpope/vim-fugitive'
call plug#end()

set exrc
set nowrap
set ignorecase
set hidden
set scrolloff=15
set foldtext=MyFoldText()
set fillchars=fold:\  
set foldmethod=syntax
set foldlevel=2
let &shellpipe="| wtee.exe"

let &grepprg = "rg --vimgrep"
let mapleader = "\<Space>"
let g:rainbow_active = 1
let g:fzf_preview_window = '' 	" Disable preview window
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

colorscheme nugl

nmap <Leader>ts :SemanticHighlightToggle<CR>
nmap <Leader>s :SemanticHighlight<CR>
nmap <Leader>/ :nohl<CR>
nmap <C-p> :Files<CR>

runtime init-coc.vim

function MyFoldText()
	let linestart = trim(getline(v:foldstart))
	let lineend = trim(getline(v:foldend))
	let indent = indent(v:foldstart)

	if linestart[0] == '(' || linestart[0] == '{' || linestart[0] == '['
		return repeat(" ", indent) . linestart[:1] . " ... " . lineend[-1:]
	else
		return repeat(" ", indent) . linestart[:-3] . "..."
	endif
endfunction
endfunction
