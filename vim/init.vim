runtime init-core.vim

call plug#begin()

    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'miniukof/FindEverything'

    Plug 'luochen1990/rainbow'
    Plug 'equalsraf/neovim-gui-shim'

    Plug 'rust-lang/rust.vim'
    Plug 'beyondmarc/hlsl.vim'
    Plug 'beyondmarc/glsl.vim'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'PProvost/vim-ps1'

    Plug 'michaeljsmith/vim-indent-object'
    
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-eunuch'
    Plug 'Konfekt/FastFold'

call plug#end()

let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['#F44336', '#9C27B0', '#2aa198', '#009688'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\	}
\}

let g:fzf_layout = { 'down': '~40%' }    
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:grepper = {}
let g:grepper.tools = ['rg']

" Insert mode completion with fzf
inoremap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-j> <plug>(fzf-complete-file-ag)
inoremap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <leader>ff :FEC 
nnoremap <leader>fa :FEA 
nnoremap <leader>fe :FEC 

nnoremap <leader>fS :FSHere<CR>
nnoremap <leader>fh :FSHere<CR>

nnoremap <Leader>tsh :SemanticHighlightToggle<cr>
nnoremap <leader>tig :IndentGuidesToggle<CR>
nnoremap <leader>trp :RainbowToggle<CR>
