" = :: =========================================================== :: =
"  Filename: /home/sartoo/.vim/colors/256-sartoo.vim
"  Filesize: 10476 Bytes on 173 Lines
"   Purpose: Vim color file
"    Author: sartoo (UID: 1000) <http://sartoo.de/> on kali
"   License: Do whatever you want, but have fun!
"   Created: 09.12.2010 11:37 CET (+0100)
"  Modified: 05.02.2011 04:56 CET (+0100)
"      Name: 256-sartoo
" Maintainer: Sartoo <+-+-+-+-+-@gmx.de>
" = :: =========================================================== :: =
"
" Die neuste Version dieser Config-Datei kann unter
" <http://sartoo.de/articles/dotfiles.html> abgerufen werden.
"
if &t_Co != 256 && ! has("gui_running")
    echomsg "err: This colorscheme is only for GUI or"
    echomsg "     256 color Terminal, thus use such"
    echomsg "     a terminal (e.g. xterm or rxvt-unicode)"
    echomsg "     or use GUI."
    finish
endif

hi clear
set background=dark
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="256-sartoo"

hi Normal       ctermfg=NONE    ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#7c8f99   gui=NONE
hi Underlined   cterm=UNDERLINE gui=UNDERLINE
hi Italic       cterm=ITALIC    gui=ITALIC
hi Comment      ctermfg=24      ctermbg=NONE    cterm=ITALIC    guibg=#000000   guifg=#005f87   gui=ITALIC
hi Constant     ctermfg=89      ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#870057   gui=NONE
hi link Number  Constant
hi link Boolean Number
hi String       ctermfg=60      ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#5f5f87   gui=NONE
hi Identifier   ctermfg=75      ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#5fafff   gui=NONE
hi link Function Identifier
hi Ignore       ctermfg=190     ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#d7ff00   gui=NONE
hi Type         ctermfg=39      ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#00afff   gui=NONE
hi PreProc      ctermfg=23      ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#005f5f   gui=NONE
hi Statement    ctermfg=69      ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#5f87ff   gui=NONE
hi Special      ctermfg=124     ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#af0000   gui=NONE
hi Todo         ctermfg=118     ctermbg=NONE    cterm=BOLD,ITALIC  guibg=NONE   guifg=#87ff00   gui=BOLD,ITALIC
hi Error        ctermfg=231     ctermbg=88      cterm=NONE      guibg=#870000   guifg=#ffffff   gui=NONE
hi Title        ctermfg=130     ctermbg=NONE    cterm=BOLD      guibg=#000000   guifg=#af5f00   gui=BOLD
hi ErrorMsg     ctermfg=160     ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#d70000   gui=NONE
hi NonText      ctermfg=52      ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#5f0000   gui=NONE
hi SpecialKey   ctermfg=52      ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#5f0000   gui=NONE
hi MatchParen   ctermfg=226     ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#ffff00   gui=NONE
hi Cursor       ctermfg=white   ctermbg=30      cterm=BOLD      guibg=#008787   guifg=#ffffff   gui=NONE
hi CursorLine   ctermfg=NONE    ctermbg=NONE    cterm=UNDERLINE guibg=NONE      guifg=NONE      gui=UNDERLINE
hi Cursorcolumn ctermfg=NONE    ctermbg=232     cterm=BOLD
hi Directory    ctermfg=76      ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#5fd700   gui=NONE
hi IncSearch    ctermfg=226     ctermbg=NONE    cterm=UNDERLINE,ITALIC guibg=#5f005f   guifg=#afd700   gui=UNDERLINE,ITALIC
hi Search       ctermfg=210     ctermbg=232     cterm=ITALIC    guibg=#5f0087   guifg=#ffd700   gui=NONE
hi StatusLineNC ctermfg=31      ctermbg=8       cterm=NONE      guibg=#2e3436   guifg=#0087af   gui=NONE
hi StatusLine   ctermfg=67      ctermbg=8       cterm=NONE      guibg=#2e3436   guifg=#5f87af   gui=NONE
hi TabLine      ctermfg=67      ctermbg=8       cterm=NONE      guibg=#111111   guifg=#5f87af   gui=NONE
hi TabLineSel   ctermfg=31      ctermbg=8       cterm=UNDERLINE,BOLD            guibg=#333333   guifg=#0087af   gui=UNDERLINE,BOLD
hi TabLineFill  ctermfg=31      ctermbg=8       cterm=NONE      guibg=#000000   guifg=#0087af   gui=NONE
hi WildMenu     ctermfg=202     ctermbg=8       cterm=UNDERLINE guibg=#2e3436   guifg=#ff5f00   gui=UNDERLINE
hi FoldColumn   ctermfg=247     ctermbg=NONE    cterm=BOLD      guibg=#000000   guifg=#9e9e9e   gui=NONE
hi Folded       ctermfg=244     ctermbg=235     cterm=ITALIC    guibg=#262626   guifg=#808080   gui=ITALIC
hi VertSplit    ctermfg=247     ctermbg=234     cterm=BOLD      guibg=#1c1c1c   guifg=#9e9e9e   gui=BOLD
hi Visual       ctermfg=154     ctermbg=234     cterm=NONE      guibg=#1c1c1c   guifg=#afff00   gui=NONE
hi VisualNOS    ctermfg=219     ctermbg=NONE    cterm=BOLD      guibg=NONE      guifg=#ffafff   gui=BOLD
hi DiffAdd      ctermfg=159     ctermbg=63      cterm=NONE      guibg=#5f5fff   guifg=#afffff   gui=NONE
hi DiffChange   ctermfg=159     ctermbg=54      cterm=NONE      guibg=#5f0087   guifg=#afffff   gui=NONE
hi DiffDelete   ctermfg=159     ctermbg=52      cterm=NONE      guibg=#5f0000   guifg=#afffff   gui=NONE
hi DiffText     ctermfg=159     ctermbg=39      cterm=NONE      guibg=#00afff   guifg=#afffff   gui=NONE
hi Question     ctermfg=118     ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#87ff00   gui=NONE
hi MoreMsg      ctermfg=118     ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#87ff00   gui=NONE
hi ModeMsg      ctermfg=89      ctermbg=NONE    cterm=NONE      guibg=#000000   guifg=#5f87af   gui=NONE
hi LineNr       ctermfg=52      ctermbg=NONE    cterm=ITALIC    guibg=#000000   guifg=#5f0000   gui=ITALIC
hi Pmenu        ctermfg=232     ctermbg=240     cterm=NONE      guibg=#585858   guifg=#080808   gui=NONE
hi PmenuSel     ctermfg=Black   ctermbg=245     cterm=BOLD      guibg=#8a8a8a   guifg=#000000   gui=BOLD
hi PmenuSbar    ctermfg=232     ctermbg=240     cterm=NONE      guibg=#585858   guifg=#080808   gui=NONE
hi PmenuThumb   ctermfg=232     ctermbg=240     cterm=NONE      guibg=#585858   guifg=#080808   gui=NONE
hi SpellBad     ctermfg=88      ctermbg=NONE    cterm=BOLD,UNDERLINE    guibg=NONE      guifg=#870000   gui=BOLD,UNDERCURL
hi SpellRare    ctermfg=90      ctermbg=NONE    cterm=BOLD,UNDERLINE    guibg=NONE      guifg=#870087   gui=BOLD,UNDERCURL
hi SpellLocal   ctermfg=98      ctermbg=NONE    cterm=BOLD,UNDERLINE    guibg=NONE      guifg=#875fd7   gui=BOLD,UNDERCURL

" = :: == Mutt/Mail Special ====================================== :: = 
hi mailHeader   ctermfg=24  ctermbg=NONE    cterm=NONE    guibg=#000000   guifg=#005f87   gui=NONE
hi mailQuoted1  ctermfg=23  ctermbg=NONE    cterm=ITALIC
hi mailQuoted2  ctermfg=29  ctermbg=NONE    cterm=ITALIC
hi mailQuoted3  ctermfg=60  ctermbg=NONE    cterm=ITALIC
hi mailQuoted4  ctermfg=66  ctermbg=NONE    cterm=ITALIC
hi mailQuoted5  ctermfg=23  ctermbg=NONE    cterm=ITALIC
hi mailQuoted6  ctermfg=23  ctermbg=NONE    cterm=ITALIC
hi link mailURL             Underlined
hi link mailEmail           mailURL
hi link mailSubject         Identifier
hi link mailHeaderKey       mailHeader
hi link mailHeaderEmail     mailEmail
hi link mailSignature       String

" = :: == zsh Special ============================================ :: = 
hi zshVariable  ctermfg=30      ctermbg=NONE    cterm=Bold      guibg=#000000   guifg=#008787   gui=Bold

" = :: == VimOutliner Colors ============================== {{{ == :: = 

hi OL1  ctermfg=189 ctermbg=NONE    cterm=ITALIC    guifg=#d7d7ff   guibg=NONE  gui=ITALIC
hi OL2  ctermfg=160 ctermbg=NONE    cterm=ITALIC    guifg=#d70000   guibg=NONE  gui=ITALIC
hi OL3  ctermfg=33  ctermbg=NONE    cterm=ITALIC    guifg=#0087ff   guibg=NONE  gui=ITALIC
hi OL4  ctermfg=93  ctermbg=NONE    cterm=ITALIC    guifg=#8700ff   guibg=NONE  gui=ITALIC
hi OL5  ctermfg=189 ctermbg=NONE    cterm=ITALIC    guifg=#d7d7ff   guibg=NONE  gui=ITALIC
hi OL6  ctermfg=160 ctermbg=NONE    cterm=ITALIC    guifg=#d70000   guibg=NONE  gui=ITALIC
hi OL7  ctermfg=33  ctermbg=NONE    cterm=ITALIC    guifg=#0087ff   guibg=NONE  gui=ITALIC
hi OL8  ctermfg=93  ctermbg=NONE    cterm=ITALIC    guifg=#8700ff   guibg=NONE  gui=ITALIC
hi OL9  ctermfg=189 ctermbg=NONE    cterm=ITALIC    guifg=#d7d7ff   guibg=NONE  gui=ITALIC

" colors for tags
hi outlTags guifg=darkred   ctermfg=darkred

" color for body text
hi BT1 ctermfg=34   ctermbg=NONE    cterm=NONE  guifg=#00afaf   guibg=NONE  gui=NONE
hi BT2 ctermfg=34   ctermbg=NONE    cterm=NONE  guifg=#00afaf   guibg=NONE  gui=NONE
hi BT3 ctermfg=34   ctermbg=NONE    cterm=NONE  guifg=#00afaf   guibg=NONE  gui=NONE
hi BT4 ctermfg=34   ctermbg=NONE    cterm=NONE  guifg=#00afaf   guibg=NONE  gui=NONE
hi BT5 ctermfg=34   ctermbg=NONE    cterm=NONE  guifg=#00afaf   guibg=NONE  gui=NONE
hi BT6 ctermfg=34   ctermbg=NONE    cterm=NONE  guifg=#00afaf   guibg=NONE  gui=NONE
hi BT7 ctermfg=34   ctermbg=NONE    cterm=NONE  guifg=#00afaf   guibg=NONE  gui=NONE
hi BT8 ctermfg=34   ctermbg=NONE    cterm=NONE  guifg=#00afaf   guibg=NONE  gui=NONE
hi BT9 ctermfg=34   ctermbg=NONE    cterm=NONE  guifg=#00afaf   guibg=NONE  gui=NONE

" color for pre-formatted text
hi PT1 guifg=blue   ctermfg=cyan
hi PT2 guifg=blue   ctermfg=cyan
hi PT3 guifg=blue   ctermfg=cyan
hi PT4 guifg=blue   ctermfg=cyan
hi PT5 guifg=blue   ctermfg=cyan
hi PT6 guifg=blue   ctermfg=cyan
hi PT7 guifg=blue   ctermfg=cyan
hi PT8 guifg=blue   ctermfg=cyan
hi PT9 guifg=blue   ctermfg=cyan

" color for tables 
hi TA1 guifg=darkviolet ctermfg=cyan
hi TA2 guifg=darkviolet ctermfg=cyan
hi TA3 guifg=darkviolet ctermfg=cyan
hi TA4 guifg=darkviolet ctermfg=cyan
hi TA5 guifg=darkviolet ctermfg=cyan
hi TA6 guifg=darkviolet ctermfg=cyan
hi TA7 guifg=darkviolet ctermfg=cyan
hi TA8 guifg=darkviolet ctermfg=cyan
hi TA9 guifg=darkviolet ctermfg=cyan

" color for user text (wrapping)
hi UT1 guifg=darkred    ctermfg=cyan
hi UT2 guifg=darkred    ctermfg=cyan
hi UT3 guifg=darkred    ctermfg=cyan
hi UT4 guifg=darkred    ctermfg=cyan
hi UT5 guifg=darkred    ctermfg=cyan
hi UT6 guifg=darkred    ctermfg=cyan
hi UT7 guifg=darkred    ctermfg=cyan
hi UT8 guifg=darkred    ctermfg=cyan
hi UT9 guifg=darkred    ctermfg=cyan

" color for user text (non-wrapping)
hi UB1 guifg=darkgray   ctermfg=cyan
hi UB2 guifg=darkgray   ctermfg=cyan
hi UB3 guifg=darkgray   ctermfg=cyan
hi UB4 guifg=darkgray   ctermfg=cyan
hi UB5 guifg=darkgray   ctermfg=cyan
hi UB6 guifg=darkgray   ctermfg=cyan
hi UB7 guifg=darkgray   ctermfg=cyan
hi UB8 guifg=darkgray   ctermfg=cyan
hi UB9 guifg=darkgray   ctermfg=cyan


