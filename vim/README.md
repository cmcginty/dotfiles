# Vim User Guide

Some basic features and non-default key-mappings in Vim.

## Plugins

### [Surround](https://github.com/tpope/vim-surround)

> Provides mappings to easily delete, change and add such surroundings in pairs.

| Command | Description |
| -------- | ----------- |
| <kbd>d</kbd> <kbd>s</kbd> | **Delete Surround** command ... |
| <kbd>ds</kbd> <kbd>"</kbd> | Remove first set of double-quotes `"` |
| <kbd>ds</kbd> <kbd>t</kbd> | Remove surrounding `<>`,`</>` tags |
|  |  |
| <kbd>c</kbd> <kbd>s</kbd> | **Change Surround** command ... |
| <kbd>cs</kbd> <kbd>"</kbd> <kbd>'</kbd> | Change double-quotes `"` to single `'` |
| <kbd>cs</kbd> <kbd>"</kbd> <kbd>&lt;q&gt;</kbd> | Change double-quotes `"` to `<q>` tag |
| <kbd>cst</kbd> <kbd>"</kbd> | Change `<tag>` to double-quotes `"` |
|  |  |
| <kbd>y</kbd> <kbd>s</kbd> | **Add Surround** command ... |
| <kbd>y</kbd> <kbd>ss</kbd> <kbd>)</kbd> | Add `(`...`)` around entire line. |
| <kbd>ys</kbd> <kbd>iw</kbd> <kbd>]</kbd> | Add `[`...`]` to selected word. <kbd>iw</kbd> is a motion selection "inner word"  |
| <kbd>ys</kbd> <kbd>iw</kbd> <kbd>t</kbd> <kbd>&lt;tag&gt;</kbd> | Add `<tag>`...`</tag>` to selected word. <kbd>iw</kbd> is a motion selection "inner word"  |
|  |  |
| <kbd>S</kbd> | **_Visual_ Add Surround** command ... |
| <kbd>viw</kbd> <kbd>S</kbd> <kbd>]</kbd> | Select word, surround with `[`...`]` |


**Tip:** There is a different between <kbd>(</kbd> and  <kbd>)</kbd>. The former
will add a space to pad the inner text. The later will not.

For speed, Surround has a few special characters that can be used in place of the actual
desired character.

| Shortcut Character | Equivalence |
| ----------------- | ----------- |
| <kbd>a</kbd> | `<` and `>` |
| <kbd>b</kbd> | `(` and `)` |
| <kbd>B</kbd> | `{` and `}` |
| <kbd>r</kbd> | `[` and `]` |
| <kbd>p</kbd> | `<CR>` and `<CR>` |
| <kbd>t</kbd> | XML tag |
