"------------------------------------------------------------------------------
"  Description: Perform Ada specific completion & tagging.
"     Language: Ada (2022)
"    Copyright: Copyright (C) 2022 … 2022 Martin Krischik
"   Maintainer: Martin Krischik <krischik@users.sourceforge.net>
"      Version: 5.5.0
"      History: 27.10.2022 MK Taglist support
"               21.08.2023 MK Release 5.5.0
"	 Usage: Use dein to install
"    Help Page: ft-ada-plugin
"------------------------------------------------------------------------------
" Provides setting for taglist plugin
"------------------------------------------------------------------------------

" Only do this when not done yet for this buffer
if exists ("g:did_adaplugin") || version < 700
   finish
endif

" Don't load another plugin for this buffer
let g:did_adaplugin = 45

"
" Temporarily set cpoptions to ensure the script loads OK
"
let s:cpoptions = &cpoptions
set cpoptions-=C

" Section: TagList {{{1
"
let g:tlist_ada_settings = 'ada;' .
    \ 'P:package spec;' .
    \ 'p:package body;' .
    \ 'T:type spec;' .
    \ 't:type;' .
    \ 'U:subtype spec;' .
    \ 'u:subtype;' .
    \ 'c:component;' .
    \ 'l:literal;' .
    \ 'V:variable spec;' .
    \ 'v:variable;' .
    \ 'f:formal;' .
    \ 'n:constant;' .
    \ 'x:exception;' .
    \ 'R:subprogram spec;' .
    \ 'r:subprogram body;' .
    \ 'K:task spec;' .
    \ 'k:task body;' .
    \ 'O:protected spec;' .
    \ 'o:protected body;' .
    \ 'E:entry spec;' .
    \ 'e:entry body;' .
    \ 'b:label;' .
    \ 'i:identifier;' .
    \ 'a:autovar;' .
    \ 'y:annon'
" }}}1

" Reset cpoptions
let &cpoptions = s:cpoptions
unlet s:cpoptions

finish

"------------------------------------------------------------------------------
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
" vim: set textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab :
" vim: set filetype=vim fileencoding=utf-8 fileformat=unix foldmethod=marker :
" vim: set spell spelllang=en_gb :
