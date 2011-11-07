" Vim filetype detection
" Language:     TaskJuggler
" Maintainer:		Max Meyer <dev@fedux.org>
autocmd BufNewFile,BufRead *.tj3,*.taskjuggler,*.tji,*.tjp
      \   set ft=tjp
