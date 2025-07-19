# TDK Dotfiles

My config files for the apps I love the most, and the apps I use the most.

## Installation

## [git](./git)

To use this config, run:

```sh
ln -s $DOTFILES/git $HOME/.config/git
```

## [nvim](./nvim)

To use this config, run:

```sh
ln -s $DOTFILES/nvim $HOME/.config/nvim
```

If you have another neovim configuration, you can try this out just by linking it to another directory name, for instance:

```sh
ln -s $DOTFILES/nvim $HOME/.config/nvim-alternative

```

In your shell rc file, put:

```sh
alias nvim-alt="NVIM_APPNAME=nvim-alternative nvim "
```

and after sourcing the file, you can run `nvim-alt` instead of default `nvim`.
