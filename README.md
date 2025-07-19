# TDK Dotfiles

My config files for the stuff I love and use the most.

## Installation

## [git](./git)

To use this config, run:

```sh
ln -s $DOTFILES/git $HOME/.config/git
```

## [nvim](./nvim)

Link it to your local config directory:

```sh
ln -s $DOTFILES/nvim $HOME/.config/nvim
```

In case you have another neovim configuration, you can link config to a directory with another name, for instance:

```sh
ln -s $DOTFILES/nvim $HOME/.config/nvim-alternative
```

In your shell source file, put:

```sh
alias nvim-alt="NVIM_APPNAME=nvim-alternative nvim "
```

and after sourcing the file, you can run `nvim-alt` instead of default `nvim`.
