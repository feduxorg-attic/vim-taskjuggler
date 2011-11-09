vim-tjp(1) -- vim syntax highlighting for taskjuggler 3
=======================================================

## DESCRIPTION

This repository contains all files need to automatically highlight
TaskJuggler-files. The detection is based on the file-suffix: *.tjp,
*.taskjuggler, *.tj3.

This repository comes with a script which fetches the original syntax file from
the taskjuggler-repository (https://github.com/taskjuggler/TaskJuggler).

## Files
By default the `setup.rb`-script installs the vim-extension to
`~/.vim/bundle.available/vim-taskjuggler`.
  * `ftdetect/tjp.vim`: Detect the filetype
  * `ftplugin/tjp.vim`: Setting options for the taskjuggler-language
  * `syntax/tjp.vim`: Syntax file 

## USAGE

```bash
git clone <repo>
cd <repo>
bundle install
./setup.rb install gem
./setup.rb install extension 
./setup.rb install syntax_file 
```

If you prefer another path to install the extension please tell the script
about it.

```bash
./setup.rb install extension <path_to_extension>
./setup.rb install syntax_file <path_to_extension>
```

