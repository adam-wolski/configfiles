" Vim syntax file
" Language: Chrome Engine Skin File
" Maintainer: Adam Wolski
" Latest Revision: 7 Feb 2016

if exists("b:current_syntax")
  finish
endif

" syn match CEComment '//.*'
syn keyword CETodo TODO Todo
syn region CEComment start='//' end='$' contains=CETodo
syn region CEString start='"' end='"' 
syn region CEBlock start='{' end='}' fold transparent
syn keyword CEBuildInFunctions EnableNewSkins ShowAll HideAll Replace UseSkin Skin SkinVersion Show ReplaceSurface ColorI UseAlpha
syn match CEInclude '!include'
syn match CEMat '"\(\d*\w*\)\.mat"'
syn match CESkn '"\(\d*\w*\)\.skn"'

let b:current_syntax = "ce_skin"

hi def link CEBuildInFunctions    Keyword
hi def link CEInclude             Keyword
hi def link CEComment             Comment
hi def link CEString              String
hi def link CEMat                 Special
hi def link CESkn                 Special
hi def link CETodo                TODO
