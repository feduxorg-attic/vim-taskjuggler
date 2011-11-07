" Vim filetype plugin
" Language:     TaskJuggler
" Maintainer:		Max Meyer <dev@fedux.org>

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

unlet! b:did_ftplugin

setlocal comments=:#
setlocal commentstring=#\ %s
setlocal formatoptions-=t formatoptions+=croql

let b:undo_ftplugin = "|setl cms< com< fo<"

" vim:set sw=2:
