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
let &statusline = "%{GitStatus()} %f %{coc#status()} %h%w%m%r%=%-14.(%l,%c%V%) %P"
let mapleader = "\<Space>"

let g:rainbow_active = 1
let g:fzf_preview_window = '' 	" Disable preview window
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

colorscheme nugl

nmap <Leader>ts :SemanticHighlightToggle<CR>
nmap <Leader>s :SemanticHighlight<CR>
nmap <Leader>/ :nohl<CR>
nmap <C-p> :Files<CR>
tnoremap <Esc> <C-\><C-n>  
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

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

function GitStatus()
	return getbufvar(bufnr('%'), 'LastGitStatus') 
endfunction

function UpdateGitStatus()
	let status = system("git diff --shortstat " . expand('%'))
	let matched = matchlist(status, '\W*\(\d*\) files\? changed, \(\d*\) insertions\?.*, \(\d*\) .*')
	if len(matched)
		let i = matched[2]
		let d = matched[3]
		return printf("+%d -%d", i, d)
	else
		return ''
	endif
endfunction

au BufEnter * let b:LastGitStatus = UpdateGitStatus()
au BufWritePost * let b:LastGitStatus = UpdateGitStatus()
