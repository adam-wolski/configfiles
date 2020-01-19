" nugl.vim -- Vim color scheme.
" Author:      Adam Wolski (miniukof@gmail.com)
" Description: Color theme that fits with your numix desktop.

hi clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'nugl'
set background=dark

" Some Color Defines  {{{

let s:white = '#f9f9f9'
let s:whitepp = '#fefefe'
let s:gray = '#dedede'
let s:graypp = '#e3e3e3'
let s:darkgray = '#333333'
let s:darkgraypp = '#383838'
let s:darkgraylighter = '#404040'
let s:darkgraylighterpp = '#454545'
let s:red = '#F44336'

" }}}
" Solarized colors  {{{

" Solarized Accents
let s:s_yellow      = "#b58900"
let s:s_orange      = "#cb4b16"
let s:s_red         = "#dc322f"
let s:s_magenta     = "#d33682"
let s:s_violet      = "#6c71c4"
let s:s_blue        = "#268bd2"
let s:s_cyan        = "#2aa198"
let s:s_green       = "#719e07"

" }}}
" Colors Palette {{{

let s:c0 = s:s_yellow
let s:c1 = s:s_orange      
let s:c2 = s:s_red         
let s:c3 = s:s_magenta     
let s:c4 = s:s_violet      
let s:c5 = s:s_blue        
let s:c6 = s:s_cyan        
let s:c7 = s:s_green       

" }}}
" Main defines  {{{

" Base {{{

let s:none = 'NONE'
let s:b = " guibg="
let s:f = " guifg="
let s:g = " gui="
let s:gsp = " guisp="

" }}}
" Default backgrounds {{{

let s:bg0 = " guibg=".s:darkgray " Main background
let s:bgn = " guibg=".s:none
let s:bgl = " guibg=".s:darkgraylighter " Light back
let s:bgL = " guibg=".s:darkgraylighterpp " Even brighter light back
let s:bgd = " guibg=".s:darkgraypp " Dark back
let s:bgD = " guibg=".s:darkgray " Even darker back

" }}}
" Accented backgrounds {{{

let s:ba0 = " guibg=".s:c0
let s:ba1 = " guibg=".s:c1
let s:ba2 = " guibg=".s:c2
let s:ba3 = " guibg=".s:c3
let s:ba4 = " guibg=".s:c4
let s:ba5 = " guibg=".s:c5
let s:ba6 = " guibg=".s:c6
let s:ba7 = " guibg=".s:c7

" }}}
" Default foregrounds {{{

let s:fgn = " guifg=NONE"
let s:fgb = " guifg=".s:darkgray " Same color as bg0
let s:fge = " guifg=".s:red " Error fg
let s:fg0 = " guifg=".s:white
let s:fg1 = " guifg=".s:whitepp " A bit brighter white
let s:fg2 = " guifg=".s:graypp 
let s:fg3 = " guifg=".s:gray " Bit darker gray
let s:fgl = " guifg=".s:darkgraylighter " Light back
let s:fgL = " guifg=".s:darkgraylighterpp " Even brighter light back
let s:fgd = " guifg=".s:darkgraypp " Dark back
let s:fgD = " guifg=".s:darkgray " Even darker back

" }}}
" Accented foregrounds {{{

let s:fa0 = " guifg=".s:c0
let s:fa1 = " guifg=".s:c1
let s:fa2 = " guifg=".s:c2
let s:fa3 = " guifg=".s:c3
let s:fa4 = " guifg=".s:c4
let s:fa5 = " guifg=".s:c5
let s:fa6 = " guifg=".s:c6
let s:fa7 = " guifg=".s:c7

" }}}
" Default gui formats {{{

let s:gn = " gui=NONE"
let s:gb = " gui=bold"
let s:gu = " gui=underline"
let s:gi = " gui=italic"
let s:gc = " gui=undercurl"
let s:gr = " gui=reverse"
let s:gs = " gui=standout"

" }}}
" Special colors {{{

let s:gs0 = " guisp=".s:c0
let s:gs1 = " guisp=".s:c1
let s:gs2 = " guisp=".s:c2
let s:gs3 = " guisp=".s:c3
let s:gs4 = " guisp=".s:c4
let s:gs5 = " guisp=".s:c5
let s:gs6 = " guisp=".s:c6
let s:gs7 = " guisp=".s:c7

" }}}

" }}}
" Basic highlighting" {{{

exe "hi! Normal"   .s:gn   .s:fg0   .s:bg0

exe "hi! Comment"   .s:gb   .s:fa1   .s:bgl
"       *Comment         any comment

exe "hi! Constant"   .s:gn   .s:fa6   .s:bgn
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10

exe "hi! Identifier"   .s:gn   .s:fa5   .s:bgn
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)
"
exe "hi! Statement"   .s:gn   .s:fa7   .s:bgn
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

exe "hi! PreProc"   .s:gn   .s:fa1   .s:bgn
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

exe "hi! Type"   .s:gn   .s:fa0   .s:bgn
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

exe "hi! Special"   .s:gn   .s:fa2   .s:bgn
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        Debug           debugging statements
exe "hi! SpecialComment"   .s:gi   .s:fa0   .s:bgn
"        SpecialComment  special things inside a comment

exe "hi! Underlined"   .s:gn   .s:fa4   .s:bgn
"       *Underlined      text that stands out, HTML links

exe "hi! Ignore"   .s:gn   .s:fgb   .s:bgn
"       *Ignore          left blank, hidden  |hl-Ignore|

exe "hi! Error"   .s:gb   .s:fa2   .s:bgn
"       *Error           any erroneous construct

exe "hi! Todo"   .s:gb   .s:fa2   .s:bgn
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX
"

" }}}
" Extended highlighting " {{{

exe "hi! SpecialKey"   .s:gb   .s:fa0   .s:bgn
exe "hi! NonText"   .s:gb   .s:fgL   .s:bgn
exe "hi! StatusLine"   .s:gn   .s:fg1   .s:bgn
exe "hi! StatusLineNC"   .s:gn   .s:fg3   .s:bgn
exe "hi! Visual"   .s:gs   .s:fg0   .s:bgn
exe "hi! Directory"   .s:gn   .s:fa5   .s:bgn
exe "hi! ErrorMsg"   .s:gr   .s:fa2   .s:bgn
exe "hi! IncSearch"   .s:gs   .s:fa1   .s:bgn
exe "hi! Search"   .s:gr   .s:fa0   .s:bgn
exe "hi! MoreMsg"   .s:gn   .s:fa5   .s:bgn
exe "hi! ModeMsg"   .s:gn   .s:fa5   .s:bgn
exe "hi! LineNr"   .s:gn   .s:fg2   .s:bgn
exe "hi! Question"   .s:gb   .s:fa6   .s:bgn
exe "hi! VertSplit"   .s:gn   .s:fg3   .s:bg0
exe "hi! Title"   .s:gb   .s:fa1   .s:bgn
exe "hi! VisualNOS"   .s:gs   .s:fgn   .s:bgd
exe "hi! WarningMsg"   .s:gb   .s:fa2   .s:bgn
exe "hi! WildMenu"   .s:gn   .s:fg2   .s:bgl
exe "hi! Folded"   .s:gn   .s:fg0   .s:bgn
exe "hi! FoldColumn"   .s:gn   .s:fg0   .s:bgd
exe "hi! DiffAdd"   .s:gb   .s:fa7   .s:bgd   .s:gs7
exe "hi! DiffChange"   .s:gb   .s:fa0   .s:bgd   .s:gs0
exe "hi! DiffDelete"   .s:gb   .s:fa2   .s:bgd
exe "hi! DiffText"   .s:gb   .s:fa5   .s:bgd   .s:gs5
exe "hi! SignColumn"   .s:gn   .s:fg0   .s:bgn
exe "hi! Conceal"   .s:gn   .s:fa5   .s:bgn
if has('gui_running')
    exe "hi! SpellBad"   .s:gc   .s:fg0   .s:bgn   .s:gs2
    exe "hi! SpellCap"   .s:gc   .s:fg0   .s:bgn   .s:gs4
    exe "hi! SpellRare"   .s:gc   .s:fg0   .s:bgn   .s:gs6
    exe "hi! SpellLocal"   .s:gc   .s:fg0   .s:bgn   .s:gs0
else
    exe "hi! SpellBad"   .s:gc   .s:fg0   .s:ba2
    exe "hi! SpellCap"   .s:gc   .s:fg0   .s:ba4
    exe "hi! SpellRare"   .s:gc   .s:fg0   .s:ba6
    exe "hi! SpellLocal"   .s:gc   .s:fg0   .s:ba0
endif
exe "hi! Pmenu"   .s:gn   .s:fg0   .s:bgd 
exe "hi! PmenuSel"   .s:gn   .s:fg2   .s:bgl 
exe "hi! PmenuSbar"   .s:gn   .s:fgl   .s:bg0 
exe "hi! PmenuThumb"   .s:gn   .s:fg0   .s:bgD 
exe "hi! TabLine"   .s:gu   .s:fg0   .s:bgd
exe "hi! TabLineFill"   .s:gu   .s:fg0   .s:bgd
exe "hi! TabLineSel"   .s:gu   .s:fg2   .s:bgl
exe "hi! CursorColumn"   .s:gn   .s:fgn   .s:bgd
exe "hi! CursorLine"   .s:gn   .s:fgn   .s:bgl
exe "hi! ColorColumn"   .s:gn   .s:fgn   .s:bgd
exe "hi! Cursor"   .s:gr   .s:fgn   .s:ba2
hi! link lCursor Cursor
exe "hi! MatchParen"   .s:gb   .s:fa2   .s:bgd

" }}}
" vim syntax highlighting " {{{

"exe "hi! vimLineComment" . s:fg2   .s:bgn   .s:gi
"hi! link vimComment Comment
"hi! link vimLineComment Comment
hi! link vimVar Identifier
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link helpSpecial Special
hi! link vimSet Normal
hi! link vimSetEqual Normal
exe "hi! vimCommentString"   .s:gn   .s:fa4   .s:bgn
exe "hi! vimCommand"   .s:gn   .s:fa0   .s:bgn
exe "hi! vimCmdSep"   .s:gb   .s:fa5   .s:bgn
exe "hi! helpExample"   .s:gn   .s:fg1   .s:bgn
exe "hi! helpOption"   .s:gn   .s:fa6   .s:bgn
exe "hi! helpNote"   .s:gn   .s:fa3.s:bgn
exe "hi! helpVim"   .s:gn   .s:fa3.s:bgn
exe "hi! helpHyperTextJump"   .s:gu   .s:fa5   .s:bgn
exe "hi! helpHyperTextEntry".s:gn   .s:fa7   .s:bgn
exe "hi! vimIsCommand"   .s:gn   .s:fg3   .s:bgn
exe "hi! vimSynMtchOpt"   .s:gn   .s:fa0   .s:bgn
exe "hi! vimSynType"   .s:gn   .s:fa6   .s:bgn
exe "hi! vimHiLink"   .s:gn   .s:fa5   .s:bgn
exe "hi! vimHiGroup"   .s:gn   .s:fa5   .s:bgn
exe "hi! vimGroup"   .s:gu   .s:fa5   .s:bgn

" }}}
" diff highlighting " {{{

hi! link diffAdded Statement
hi! link diffLine Identifier

" }}}
" git & gitcommit highlighting " {{{

"git
"exe "hi! gitDateHeader"
"exe "hi! gitIdentityHeader"
"exe "hi! gitIdentityKeyword"
"exe "hi! gitNotesHeader"
"exe "hi! gitReflogHeader"
"exe "hi! gitKeyword"
"exe "hi! gitIdentity"
"exe "hi! gitEmailDelimiter"
"exe "hi! gitEmail"
"exe "hi! gitDate"
"exe "hi! gitMode"
"exe "hi! gitHashAbbrev"
"exe "hi! gitHash"
"exe "hi! gitReflogMiddle"
"exe "hi! gitReference"
"exe "hi! gitStage"
"exe "hi! gitType"
"exe "hi! gitDiffAdded"
"exe "hi! gitDiffRemoved"
"gitcommit
"exe "hi! gitcommitSummary"      
exe "hi! gitcommitComment"   .s:gi   .s:fg2   .s:bgn
hi! link gitcommitUntracked gitcommitComment
hi! link gitcommitDiscarded gitcommitComment
hi! link gitcommitSelected  gitcommitComment
exe "hi! gitcommitUnmerged"   .s:gb   .s:fa7   .s:bgn
exe "hi! gitcommitOnBranch"   .s:gb   .s:fg2   .s:bgn
exe "hi! gitcommitBranch"   .s:gb   .s:fa3   .s:bgn
hi! link gitcommitNoBranch gitcommitBranch
exe "hi! gitcommitDiscardedType".s:gn   .s:fa2   .s:bgn
exe "hi! gitcommitSelectedType"   .s:gn   .s:fa7   .s:bgn
"exe "hi! gitcommitUnmergedType"
"exe "hi! gitcommitType"
"exe "hi! gitcommitNoChanges"
"exe "hi! gitcommitHeader"
exe "hi! gitcommitHeader"   .s:gn   .s:fg2   .s:bgn
exe "hi! gitcommitUntrackedFile".s:gb   .s:fa6   .s:bgn
exe "hi! gitcommitDiscardedFile".s:gb   .s:fa2   .s:bgn
exe "hi! gitcommitSelectedFile"   .s:gb   .s:fa7   .s:bgn
exe "hi! gitcommitUnmergedFile"   .s:gb   .s:fa0   .s:bgn
exe "hi! gitcommitFile"   .s:gb   .s:fg0   .s:bgn
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow  gitcommitSelectedFile
hi! link gitcommitUnmergedArrow  gitcommitUnmergedFile
"exe "hi! gitcommitArrow"
"exe "hi! gitcommitOverflow"
"exe "hi! gitcommitBlank"

" }}}
" html highlighting " {{{

exe "hi! htmlTag"   .s:gn   .s:fg2   .s:bgn
exe "hi! htmlEndTag"   .s:gn   .s:fg2   .s:bgn
exe "hi! htmlTagN"   .s:gb   .s:fg1   .s:bgn
exe "hi! htmlTagName"   .s:gb   .s:fa5   .s:bgn
exe "hi! htmlSpecialTagName".s:gi   .s:fa5   .s:bgn
exe "hi! htmlArg"   .s:gn   .s:fg3   .s:bgn
exe "hi! javaScript"   .s:gn   .s:fa0   .s:bgn

" }}}
" perl highlighting " {{{

exe "hi! perlHereDoc"    . s:fg1   .s:bg0   .s:gn
exe "hi! perlVarPlain"   . s:fa0   .s:bg0   .s:gn
exe "hi! perlStatementFileDesc". s:fa6.s:bg0.s:gn


" }}}
" tex highlighting " {{{

exe "hi! texStatement"   .s:fa6   .s:bg0   .s:gn
exe "hi! texMathZoneX"   .s:fa0   .s:bg0   .s:gn
exe "hi! texMathMatcher" .s:fa0   .s:bg0   .s:gn
exe "hi! texMathMatcher" .s:fa0   .s:bg0   .s:gn
exe "hi! texRefLabel"    .s:fa0   .s:bg0   .s:gn

" }}}
" haskell syntax highlighting" {{{

" ---------------------------------------------------------------------
" For use with syntax/haskell.vim : Haskell Syntax File
" http://www.vim.org/scripts/script.php?script_id=3034
" See also Steffen Siering's github repository:
" http://github.com/urso/dotrc/blob/master/vim/syntax/haskell.vim
" ---------------------------------------------------------------------
"
" Treat True and False specially, see the plugin referenced above
let hs_highlight_boolean=1
" highlight delims, see the plugin referenced above
let hs_highlight_delimiters=1

exe "hi! cPreCondit". s:fa1.s:bgn   .s:gn

exe "hi! VarId"    . s:fa5   .s:bgn   .s:gn
exe "hi! ConId"    . s:fa0   .s:bgn   .s:gn
exe "hi! hsImport" . s:fa3.s:bgn   .s:gn
exe "hi! hsString" . s:fg3   .s:bgn   .s:gn

exe "hi! hsStructure"        . s:fa6   .s:bgn   .s:gn
exe "hi! hs_hlFunctionName"  . s:fa5   .s:bgn
exe "hi! hsStatement"        . s:fa6   .s:bgn   .s:gn
exe "hi! hsImportLabel"      . s:fa6   .s:bgn   .s:gn
exe "hi! hs_OpFunctionName"  . s:fa0   .s:bgn   .s:gn
exe "hi! hs_DeclareFunction" . s:fa1   .s:bgn   .s:gn
exe "hi! hsVarSym"           . s:fa6   .s:bgn   .s:gn
exe "hi! hsType"             . s:fa0   .s:bgn   .s:gn
exe "hi! hsTypedef"          . s:fa6   .s:bgn   .s:gn
exe "hi! hsModuleName"       . s:fa7   .s:bgn   .s:gu
exe "hi! hsModuleStartLabel" . s:fa3.s:bgn   .s:gn
hi! link hsImportParams      Delimiter
hi! link hsDelimTypeExport   Delimiter
hi! link hsModuleStartLabel  hsStructure
hi! link hsModuleWhereLabel  hsModuleStartLabel

" following is for the haskell-conceal plugin
" the first two items don't have an impact, but better safe
exe "hi! hsNiceOperator"     . s:fa6   .s:bgn   .s:gn
exe "hi! hsniceoperator"     . s:fa6   .s:bgn   .s:gn

" }}}
" Rust highlighting  {{{

exe "hi! rustDerive"   .s:bg0   .s:fa1   .s:gn
exe "hi! rustStorage"   .s:bg0   .s:fa0   .s:gn
exe "hi! rustReservedKeyword"   .s:bg0   .s:fa0   .s:gn

" }}}
" Python highlighting  {{{

exe "hi! pythonComment"   .s:bg0   .s:fa0   .s:gb

" }}}
" ce_skin hightlighting {{{

exe "hi! CEReplace"   .s:bg0   .s:fa4   .s:gn
exe "hi! CEMat"   .s:bg0   .s:fa4   .s:gn
exe "hi! CESkn"   .s:bg0   .s:fa3   .s:gn

" }}}
