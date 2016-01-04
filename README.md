Dotfiles
=================

Dotfile configuration targeting [Linux Mint 17.x][mint] OS.

- [Z shell][zsh] w/ [Prezto][prezto]
- [Tmux][tmux]

Installation
------------

```bash
cd ~
git clone https://github.com/cmcginty/dotfiles
cd dotfiles
./install
```

**Existing files will not be modified.**

Check for warnings in the install output for existing files that conflict.

Citations
---------

This work is derivative from a large number of shared dotfile repos used as
resources and inspiration.

The framework is based on [Dotbot][dotbot] and forked from the [Dotbot
Template][fork]. I surveyed a large number of "dotfile frameworks", and
chose DotBot for its clean and simple design and limited lock-in.

The dotfiles leverage other projects:

* [Base16 Color][base16]
* [Prezto ZSH][prezto]
* [Powerline Fonts][powerline]

Additional dotfile projects used for source and/or inspiration:

* [Holman's Dotfiles][holman_dotfiles]
* [Skwp's YDAR Dotfiles][yadr_dotfiles]

Information
---------------

More links for help on setting up and creating your own dotfile repo:

* [GitHub Dotfiles][gitdotfiles]
* [Dotbot][dotbot]

License
-------

This software is hereby released into the public domain. That means you can do
whatever you want with it without restriction. See `LICENSE.md` for details.

[base16]: https://github.com/chriskempson/base16
[dotbot]: https://github.com/anishathalye/dotbot
[fork]: https://github.com/anishathalye/dotfiles_template/fork
[gitdotfiles]: https://dotfiles.github.io/
[holman_dotfiles]: https://github.com/holman/dotfiles
[mint]: http://linuxmint.com
[powerline]: https://github.com/powerline/fonts
[prezto]: https://github.com/sorin-ionescu/prezto
[tmux]: https://tmux.github.io
[yadr_dotfiles]: https://github.com/skwp/dotfiles
[zsh]: http://www.zsh.org
