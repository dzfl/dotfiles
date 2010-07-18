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
hi Question        ctermfg=15

" Split area
hi StatusLine      ctermfg=254   ctermbg=237 cterm=NONE
hi StatusLineNC    ctermfg=0   ctermbg=243 cterm=NONE
hi VertSplit       ctermfg=240
hi WildMenu        ctermfg=109

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
hi LineNr          ctermfg=239  ctermbg=0
hi NonText         ctermfg=88
hi SpecialKey      ctermfg=248  ctermbg=NONE
hi Title           ctermfg=109  ctermbg=NONE
hi Visual          ctermfg=0    ctermbg=109

" Syntax group
hi Comment         ctermfg=245

hi Constant        ctermfg=73
hi String          ctermfg=67
hi Character       ctermfg=30
hi Number          ctermfg=66
hi Boolean         ctermfg=108
hi Float           ctermfg=66
hi Error           ctermfg=15   ctermbg=196

hi Identifier      ctermfg=203  cterm=NONE
hi Function        ctermfg=205

hi Statement       ctermfg=144
hi Conditional     ctermfg=144
hi Repeat          ctermfg=144
hi Label           ctermfg=144
hi Operator        ctermfg=145
hi Keyword         ctermfg=144
hi Exception       ctermfg=144

hi Ignore          ctermfg=NONE ctermbg=NONE
hi PreProc         ctermfg=175
hi Special         ctermfg=138
hi Todo            ctermfg=0    ctermbg=11
hi Type            ctermfg=15
hi Underlined      ctermfg=202  cterm=underline

" Tab
hi TabLine         cterm=underline ctermfg=247 ctermbg=NONE
hi TabLineSel      cterm=underline ctermfg=15 ctermbg=NONE
hi TabLineFill     cterm=underline ctermfg=240 ctermbg=NONE

" Pmenu
hi Pmenu           ctermbg=8
hi PmenuSel        ctermbg=67
hi PmenuSbar       ctermbg=0


