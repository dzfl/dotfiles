" Vim color file
" Maintainer: dzfl <tomo.dzfl@gmail.com>
" Last Change: 2010-07-15
"""
let colors_name = "dzfl"

set background=dark

if exists("syntax_on")
    syntax reset
endif

hi clear

hi Normal          ctermfg=15 ctermbg=NONE

" Search
hi IncSearch       ctermfg=0   ctermbg=47
hi Search          ctermfg=0   ctermbg=42
hi MatchParen      ctermfg=15  ctermbg=102

" Messages
hi ErrorMsg        ctermfg=15  ctermbg=196
hi WarningMsg      ctermfg=196 ctermbg=NONE
hi ModeMsg         ctermfg=109 cterm=NONE
hi MoreMsg         ctermfg=109
hi Question        ctermfg=192

" Split area
hi StatusLine      ctermfg=232 ctermbg=30
hi StatusLineNC    ctermfg=232 ctermbg=244
hi VertSplit       ctermfg=240
hi WildMenu        ctermfg=14 ctermbg=235

" Diff
"hi DiffText        ctermfg=NONE ctermbg=NONE
"hi DiffChange      ctermfg=NONE ctermbg=NONE
"hi DiffDelete      ctermfg=NONE ctermbg=NONE
"hi DiffAdd         ctermfg=NONE ctermbg=NONE

" Cursor
hi Cursor          ctermfg=0    ctermbg=5

" Fold
hi Folded          ctermfg=109 ctermbg=0
hi FoldColumn      ctermfg=109

" Other
"hi Directory       ctermfg=2    ctermbg=NONE
hi LineNr          ctermfg=243  ctermbg=0
hi NonText         ctermfg=88
hi SpecialKey      ctermfg=240  ctermbg=NONE
hi Title           ctermfg=109  ctermbg=NONE
hi Visual          ctermfg=0    ctermbg=109

" Syntax group
hi Comment         ctermfg=245

hi Constant        ctermfg=73
hi String          ctermfg=66
hi Character       ctermfg=145
hi Number          ctermfg=144
hi Boolean         ctermfg=108
hi Float           ctermfg=66
hi Error           ctermfg=15   ctermbg=196

hi Identifier      ctermfg=203  cterm=NONE
hi Function        ctermfg=154

hi Statement       ctermfg=107
hi Conditional     ctermfg=107
hi Repeat          ctermfg=107
hi Label           ctermfg=251
hi Operator        ctermfg=145
hi Keyword         ctermfg=144
hi Exception       ctermfg=144

hi Ignore          ctermfg=NONE ctermbg=NONE
hi PreProc         ctermfg=151
hi Special         ctermfg=138
hi Todo            ctermfg=0    ctermbg=3
hi Type            ctermfg=110
hi Underlined      ctermfg=202  cterm=underline

" Tab
hi TabLine         cterm=underline ctermfg=247 ctermbg=NONE
hi TabLineSel      cterm=underline ctermfg=15 ctermbg=NONE
hi TabLineFill     cterm=underline ctermfg=240 ctermbg=NONE

" Pmenu
hi Pmenu           ctermfg=247  ctermbg=235
hi PmenuSel        ctermfg=14   ctermbg=238
hi PmenuSbar       ctermfg=238    ctermbg=234
hi PmenuThumb      ctermfg=66

hi SpellLocal ctermfg=14  ctermbg=237
hi SpellBad   ctermfg=9   ctermbg=237
hi SpellCap   ctermfg=12  ctermbg=237
hi SpellRare  ctermfg=13  ctermbg=237
