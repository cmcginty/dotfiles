# Custom keymap commands
#
# Save file / switch to Vim normal mode
atom.commands.add 'atom-text-editor.vim-mode-plus', 'custom:vim-save': (e) ->
    editor = atom.workspace.getActiveTextEditor()
    editor.save()
    atom.commands.dispatch(e.currentTarget, 'vim-mode-plus:reset-normal-mode')
