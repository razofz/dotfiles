" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "raz"

highlight Comment	 ctermfg=DarkGray						  guifg=#808080
highlight Constant	 ctermfg=DarkBlue			   cterm=none guifg=#00ffff				  gui=none
highlight Identifier ctermfg=Brown						  guifg=#00c0c0
highlight Statement  ctermfg=Brown			   cterm=bold guifg=#c0c000				  gui=bold
highlight PreProc	 ctermfg=DarkGreen						  guifg=#00ff00
highlight Type		 ctermfg=Green						  guifg=#00c000
highlight Special	 ctermfg=DarkGray						  guifg=#0000ff
highlight Error					ctermbg=DarkRed							guibg=#ff0000
highlight Todo		 ctermfg=Gray	ctermbg=DarkYellow			  guifg=#000080 guibg=#c0c000
highlight Directory  ctermfg=DarkGreen						  guifg=#00c000
highlight StatusLine ctermfg=Black ctermbg=DarkGreen cterm=none guifg=#ffff00 guibg=#0000ff gui=none
highlight Normal	ctermfg=White									  guifg=#ffffff guibg=#000000
highlight Search				ctermbg=DarkBlue							guibg=#c0c000
hi LineNr	ctermfg=DarkGray
