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
let s:indigo = '#7986CB'
let s:red = '#F44336'
let s:cyan = '#00BCD4'
let s:amber = '#FFC107'

let s:none = 'NONE'

let s:b = " guibg="
let s:f = " guifg="
let s:g = " gui="
let s:gsp = " guisp="
" Default background
let s:bg = " guibg=".s:darkgray
let s:bgl = " guibg=".s:darkgraylighter
" Default gui
let s:gn = " gui=NONE"
let s:gb = " gui=bold"
let s:gu = " gui=underline"
" Warning background
let s:warnbg = " guibg=".s:orange

exe "hi! Normal"                .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! NonText"               .s:bg                   .s:f   .s:white            .s:gn
exe "hi! Comment"               .s:bg                   .s:f   .s:amber            .s:gn
exe "hi! Constant"              .s:bg                   .s:f   .s:blue             .s:gn
exe "hi! Error"                 .s:bg                   .s:f   .s:red              .s:gn
exe "hi! Identifier"            .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! Ignore"                .s:bg                   .s:f   .s:darkgray         .s:gn
exe "hi! PreProc"               .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! Special"               .s:bg                   .s:f   .s:amber            .s:gn
exe "hi! Statement"             .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! String"                .s:bg                   .s:f   .s:green            .s:gn
exe "hi! Todo"                  .s:bg                   .s:f   .s:gray             .s:gb
exe "hi! Type"                  .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! Underlined"            .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! StatusLine"            .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! StatusLineNC"          .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! VertSplit"             .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! TabLine"               .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! TabLineFill"           .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! TabLineSel"            .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! Title"                 .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! CursorLine"            .s:bgl                  .s:f   .s:none             .s:gn
exe "hi! LineNr"                .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! CursorLineNr"          .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! helpLeadBlank"         .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! helpNormal"            .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! Visual"                .s:b    .s:orange       .s:f   .s:white            .s:gn
exe "hi! VisualNOS"             .s:b    .s:orange       .s:f   .s:white            .s:gn
exe "hi! Pmenu"                 .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! PmenuSbar"             .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! PmenuSel"              .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! PmenuThumb"            .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! FoldColumn"            .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! Folded"                .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! WildMenu"              .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! SpecialKey"            .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! DiffAdd"               .s:bg                   .s:f   .s:green            .s:gn         
exe "hi! DiffChange"            .s:bg                   .s:f   .s:red              .s:gn
exe "hi! DiffDelete"            .s:bg                   .s:f   .s:red              .s:gn
exe "hi! DiffText"              .s:bg                   .s:f   .s:white            .s:gn
exe "hi! IncSearch"             .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! Search"                .s:bg                   .s:f   .s:orange           .s:gu
exe "hi! Directory"             .s:bg                   .s:f   .s:cyan             .s:gn
exe "hi! MatchParen"            .s:bg                   .s:f   .s:amber            .s:gb
exe "hi! SpellBad"              .s:bg                   .s:f   .s:red              .s:gb .s:gsp .s:red
exe "hi! SpellCap"              .s:bg                   .s:f   .s:gray             .s:gn .s:gsp .s:blue
exe "hi! SpellLocal"            .s:bg                   .s:f   .s:gray             .s:gn .s:gsp .s:orange
exe "hi! SpellRare"             .s:bg                   .s:f   .s:gray             .s:gn .s:gsp .s:indigo
exe "hi! ColorColumn"           .s:bgl                  .s:f   .s:gray             .s:gn
exe "hi! signColumn"            .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! ErrorMsg"              .s:bg                   .s:f   .s:red              .s:gn
exe "hi! ModeMsg"               .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! MoreMsg"               .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! Question"              .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! WarningMsg"            .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! Cursor"                .s:b    .s:orange       .s:f   .s:gray             .s:gn
exe "hi! CursorColumn"          .s:b    .s:gray         .s:f   .s:none             .s:gn
exe "hi! IndentGuidesOdd"       .s:b    .s:black        .s:f   .s:gray             .s:gn
exe "hi! IndentGuidesEven"      .s:bgl                  .s:f   .s:gray             .s:gn
exe "hi! Macro"                 .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! Keyword"               .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! Boolean"               .s:bg                   .s:f   .s:green            .s:gn
exe "hi! Character"             .s:bg                   .s:f   .s:green            .s:gn
exe "hi! Number"                .s:bg                   .s:f   .s:cyan             .s:gn
exe "hi! Conditional"           .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! Debug"                 .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! Define"                .s:bg                   .s:f   .s:amber            .s:gn
exe "hi! Delimiter"             .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! Exception"             .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! Float"                 .s:bg                   .s:f   .s:cyan             .s:gn
exe "hi! Label"                 .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! Operator"              .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! PreCondit"             .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! PreProc"               .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! Repeat"                .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! SignColumn"            .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! SpecialChar"           .s:bg                   .s:f   .s:amber            .s:gn
exe "hi! SpecialComment"        .s:bg                   .s:f   .s:amber            .s:gn
exe "hi! StorageClass"          .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! Structure"             .s:bg                   .s:f   .s:cyan             .s:gn
exe "hi! Typedef"               .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! TabLineFill"           .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! TabLine"               .s:bg                   .s:f   .s:gray             .s:gn
exe "hi! Function"              .s:bg                   .s:f   .s:indigo           .s:gn
exe "hi! rustDerive"            .s:bg                   .s:f   .s:amber            .s:gn
exe "hi! rustStorage"           .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! rustReservedKeyword"   .s:bg                   .s:f   .s:orange           .s:gn
exe "hi! CEReplace"             .s:bg                   .s:f   .s:blue             .s:gn
exe "hi! CEMat"                 .s:bg                   .s:f   .s:blue             .s:gn
exe "hi! CESkn"                 .s:bg                   .s:f   .s:cyan             .s:gn
