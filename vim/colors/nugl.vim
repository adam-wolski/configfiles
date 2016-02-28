" nugl.vim -- Vim color scheme.
" Author:      Adam Wolski (miniukof@gmail.com)
" Description: Vim Theme based on numix and google colors.

hi clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'nugl'
set background=dark

let s:white = '#f9f9f9'
let s:gray = '#dedede'
let s:orange = '#d64937'
let s:darkgray = '#333333'
let s:darkgraylighter = '#404040'
let s:black = '#2d2d2d'
let s:green = '#81C784'
let s:blue = '#42A5F5'
let s:lightblue = '#4FC3F7'
let s:indigo = '#7986CB'
let s:red = '#F44336'
let s:cyan = '#00BCD4'
let s:amber = '#FFC107'
let s:pink = '#E91E63'
let s:purple = '#9C27B0'
let s:deeppurple = '#673AB7'
let s:teal = '#009688'
let s:lime = '#CDDC39'

let s:none = 'NONE'
let s:b = " guibg="
let s:f = " guifg="
let s:g = " gui="
let s:gsp = " guisp="
" Default backgrounds
let s:bg0 = " guibg=".s:darkgray
let s:bg1 = " guibg=".s:darkgraylighter
let s:bg2 = " guibg=".s:gray
" Accented backgrounds
let s:ba0 = " guibg=".s:orange
" Default foregrounds
let s:fgn = " guifg=NONE"
let s:fgb = " guifg=".s:darkgray " Same color as bg0
let s:fge = " guifg=".s:red " Error fg
let s:fg0 = " guifg=".s:white
let s:fg1 = " guifg=".s:gray
" Accented foregrounds
let s:fa0 = " guifg=".s:orange
let s:fa1 = " guifg=".s:amber
let s:fa2 = " guifg=".s:green
let s:fa3 = " guifg=".s:cyan
let s:fa4 = " guifg=".s:blue
let s:fa5 = " guifg=".s:indigo
" Default gui
let s:gn = " gui=NONE"
let s:gb = " gui=bold"
let s:gu = " gui=underline"

exe "hi! Normal"                .s:bg0  .s:fg1  .s:gn
exe "hi! NonText"               .s:bg0  .s:fg0  .s:gn
exe "hi! Comment"               .s:bg0  .s:fa1  .s:gn
exe "hi! Constant"              .s:bg0  .s:fa4  .s:gn
exe "hi! Error"                 .s:bg0  .s:fge  .s:gn
exe "hi! Identifier"            .s:bg0  .s:fg1  .s:gn
exe "hi! Ignore"                .s:bg0  .s:fgb  .s:gn
exe "hi! PreProc"               .s:bg0  .s:fg1  .s:gn
exe "hi! Special"               .s:bg0  .s:fa1  .s:gn
exe "hi! Statement"             .s:bg0  .s:fa0  .s:gn
exe "hi! String"                .s:bg0  .s:fa2  .s:gn
exe "hi! Todo"                  .s:bg0  .s:fg1  .s:gb
exe "hi! Type"                  .s:bg0  .s:fa0  .s:gn
exe "hi! Underlined"            .s:bg0  .s:fa0  .s:gn
exe "hi! StatusLine"            .s:bg0  .s:fg1  .s:gn
exe "hi! StatusLineNC"          .s:bg0  .s:fg1  .s:gn
exe "hi! VertSplit"             .s:bg0  .s:fg1  .s:gn
exe "hi! TabLine"               .s:bg0  .s:fg1  .s:gn
exe "hi! TabLineFill"           .s:bg0  .s:fg1  .s:gn
exe "hi! TabLineSel"            .s:bg0  .s:fg1  .s:gn
exe "hi! Title"                 .s:bg0  .s:fg1  .s:gn
exe "hi! CursorLine"            .s:bg1  .s:fgn  .s:gn
exe "hi! LineNr"                .s:bg0  .s:fg1  .s:gn
exe "hi! CursorLineNr"          .s:bg0  .s:fg1  .s:gn
exe "hi! helpLeadBlank"         .s:bg0  .s:fg1  .s:gn
exe "hi! helpNormal"            .s:bg0  .s:fg1  .s:gn
exe "hi! Visual"                .s:ba0  .s:fg0  .s:gn
exe "hi! VisualNOS"             .s:ba0  .s:fg0  .s:gn
exe "hi! Pmenu"                 .s:bg0  .s:fg1  .s:gn
exe "hi! PmenuSbar"             .s:bg0  .s:fg1  .s:gn
exe "hi! PmenuSel"              .s:bg0  .s:fa0  .s:gn
exe "hi! PmenuThumb"            .s:bg0  .s:fg1  .s:gn
exe "hi! FoldColumn"            .s:bg0  .s:fg1  .s:gn
exe "hi! Folded"                .s:bg0  .s:fg1  .s:gn
exe "hi! WildMenu"              .s:bg0  .s:fg1  .s:gn
exe "hi! SpecialKey"            .s:bg0  .s:fa0  .s:gn
exe "hi! DiffAdd"               .s:bg0  .s:fa2  .s:gn         
exe "hi! DiffChange"            .s:bg0  .s:fge  .s:gn
exe "hi! DiffDelete"            .s:bg0  .s:fge  .s:gn
exe "hi! DiffText"              .s:bg0  .s:fg0  .s:gn
exe "hi! IncSearch"             .s:bg0  .s:fa0  .s:gn
exe "hi! Search"                .s:bg0  .s:fa0  .s:gu
exe "hi! Directory"             .s:bg0  .s:fa3  .s:gn
exe "hi! MatchParen"            .s:bg0  .s:fa1  .s:gb
exe "hi! SpellBad"              .s:bg0  .s:fge  .s:gb .s:gsp .s:red
exe "hi! SpellCap"              .s:bg0  .s:fg1  .s:gn .s:gsp .s:blue
exe "hi! SpellLocal"            .s:bg0  .s:fg1  .s:gn .s:gsp .s:orange
exe "hi! SpellRare"             .s:bg0  .s:fg1  .s:gn .s:gsp .s:indigo
exe "hi! ColorColumn"           .s:bg1  .s:fg1  .s:gn
exe "hi! signColumn"            .s:bg0  .s:fg1  .s:gn
exe "hi! ErrorMsg"              .s:bg0  .s:fge  .s:gn
exe "hi! ModeMsg"               .s:bg0  .s:fg1  .s:gn
exe "hi! MoreMsg"               .s:bg0  .s:fg1  .s:gn
exe "hi! Question"              .s:bg0  .s:fg1  .s:gn
exe "hi! WarningMsg"            .s:bg0  .s:fg1  .s:gn
exe "hi! Cursor"                .s:ba0  .s:fg1  .s:gn
exe "hi! CursorColumn"          .s:bg2  .s:fgn  .s:gn
exe "hi! IndentGuidesOdd"       .s:bg2  .s:fg1  .s:gn
exe "hi! IndentGuidesEven"      .s:bg1  .s:fg1  .s:gn
exe "hi! Macro"                 .s:bg0  .s:fa0  .s:gn
exe "hi! Keyword"               .s:bg0  .s:fa0  .s:gn
exe "hi! Boolean"               .s:bg0  .s:fa2  .s:gn
exe "hi! Character"             .s:bg0  .s:fa2  .s:gn
exe "hi! Number"                .s:bg0  .s:fa3  .s:gn
exe "hi! Conditional"           .s:bg0  .s:fa0  .s:gn
exe "hi! Debug"                 .s:bg0  .s:fa0  .s:gn
exe "hi! Define"                .s:bg0  .s:fa1  .s:gn
exe "hi! Delimiter"             .s:bg0  .s:fg1  .s:gn
exe "hi! Exception"             .s:bg0  .s:fa0  .s:gn
exe "hi! Float"                 .s:bg0  .s:fa3  .s:gn
exe "hi! Label"                 .s:bg0  .s:fa0  .s:gn
exe "hi! Operator"              .s:bg0  .s:fa0  .s:gn
exe "hi! PreCondit"             .s:bg0  .s:fa0  .s:gn
exe "hi! PreProc"               .s:bg0  .s:fa0  .s:gn
exe "hi! Repeat"                .s:bg0  .s:fa0  .s:gn
exe "hi! SignColumn"            .s:bg0  .s:fg1  .s:gn
exe "hi! SpecialChar"           .s:bg0  .s:fa1  .s:gn
exe "hi! SpecialComment"        .s:bg0  .s:fa1  .s:gn
exe "hi! StorageClass"          .s:bg0  .s:fg1  .s:gn
exe "hi! Structure"             .s:bg0  .s:fa3  .s:gn
exe "hi! Typedef"               .s:bg0  .s:fa0  .s:gn
exe "hi! TabLineFill"           .s:bg0  .s:fg1  .s:gn
exe "hi! TabLine"               .s:bg0  .s:fg1  .s:gn
exe "hi! Function"              .s:bg0  .s:fa5  .s:gn
exe "hi! rustDerive"            .s:bg0  .s:fa1  .s:gn
exe "hi! rustStorage"           .s:bg0  .s:fa0  .s:gn
exe "hi! rustReservedKeyword"   .s:bg0  .s:fa0  .s:gn
exe "hi! CEReplace"             .s:bg0  .s:fa4  .s:gn
exe "hi! CEMat"                 .s:bg0  .s:fa4  .s:gn
exe "hi! CESkn"                 .s:bg0  .s:fa3  .s:gn
