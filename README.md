vim-tjp(1) -- vim syntax highlighting for taskjuggler 3
=======================================================

## DESCRIPTION

This repository contains all files need to automatically highlight
TaskJuggler-files. The detection is based on the file-suffix: .tjp,
.taskjuggler, .tj3.

This repository comes with a script which fetches the syntax file from
the taskjuggler-repository (https://github.com/taskjuggler/TaskJuggler). It's
not included in this git-repo.

By default the `setup.rb`-script installs the vim-extension to
`~/.vim/bundle.available/vim-taskjuggler`. If you might wonder why I did it
that way, please look at https://github.com/tpope/vim-pathogen. This plugin
enables you to have one directory per vim-extension.

## DEPENDENCIES

I use different rubygems to get that thing running.
  * Bundler (http://gembundler.com/)
  * Thor (https://github.com/wycats/thor)
  * Open4 (https://github.com/ahoward/open4)

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
about it (not tested yet).

```bash
./setup.rb install extension <path_to_extension>
./setup.rb install syntax_file <path_to_extension>
```

## Files
  * `ftdetect/tjp.vim`: Detect the filetype
  * `ftplugin/tjp.vim`: Setting options for the taskjuggler-language
  * `syntax/tjp.vim`: Syntax file 
  * `setup.rb`: Installer-script


## Support

Please drop me a message via github if you experience any problems.
