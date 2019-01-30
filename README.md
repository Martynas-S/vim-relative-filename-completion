# relative-filename-completion.vim

Simple plugin for relative filename completion, relative to the current
buffer (useful for languages like javascript)
After completing the filename, the cwd is changed back to what it was.
This enables relative filename completion without having to `set autochdir`, which
can mess with other plugins and wanted configuration.

The default mapping is `i_CTRL-X_CTRL-R`. It can be rebound using
`<Plug>RelativeFilenameCompletion`

## Installation

Use your favorite package manager.

Example using Vundle

```
" The .vimrc file

Plugin 'Martynas-S/vim-relative-filename-completion'
```
and then run `:PluginInstall`
