vim-tjp(1) -- vim syntax highlighting for taskjuggler 3
=======================================================

## DESCRIPTION

This repository contains all files need to automatically highlight
TaskJuggler-files. The detection is based on the file-suffix: *.tjp,
*.taskjuggler, *.tj3.

This repository comes with a script which fetches the original syntax file from
the taskjuggler-repository (https://github.com/taskjuggler/TaskJuggler).

## Files
  * `ftdetect/tjp.vim`: Detect the filetype
  * `ftplugin/tjp.vim`: Setting options for the taskjuggler-language
  * `syntax/tjp.vim`: Syntax file 
