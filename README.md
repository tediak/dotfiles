# TDK Dotfiles

![](./assets/nvim-welcome.png)

My config files for the stuff I love and use the most.

## Installation

## [ghostty](./ghostty)

To use the config, run (replace Ghostty config directory if you are not a MacOS user):

```sh
ln -s $DOTFILES/ghostty/config /Library/Application\ Support/com.mitchellh.ghostty/config
```

## [git](./git)

To use this config, run:

```sh
ln -s $DOTFILES/git $HOME/.config/git
```

## [nvim](./nvim)

Link it to your local config directory:

```shell
ln -s $DOTFILES/nvim $HOME/.config/nvim
```

In case you have another neovim configuration, you can link config to a directory with another name, for instance:

```shell
ln -s $DOTFILES/nvim $HOME/.config/nvim-alternative
```

In your shell source file, put:

```sh
alias nvim-alt="NVIM_APPNAME=nvim-alternative nvim "
```

and after sourcing the file, you can run `nvim-alt` instead of default `nvim`.

## [zsh](./zsh)

To use prompt and aliases, add this to your .zshrc:

```sh
export ZSH="$HOME/.config/zsh"

source $ZSH/tdk-prompt.zsh
# source $ZSH/common-aliases.zsh
# source $ZSH/tdk-aliases.zsh
```

(check aliases before enabling them)
