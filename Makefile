DOTFILES=${HOME}/my/dotfiles

tmux-reload:
	tmux source-file tmux/tmux.conf

link-ghostty:
	ln -si ${DOTFILES}/ghostty ${HOME}/.config/ghostty

link-git:
	ln -si ${DOTFILES}/git ${HOME}/.config/git

link-navi:
	ln -si ${DOTFILES}/navi ${HOME}/.config/navi

link-nvim:
	ln -si ${DOTFILES}/nvim ${HOME}/.config/nvim

link-skhd:
	ln -si ${DOTFILES}/skhd/skhdrc ${HOME}/.skhdrc

link-tmux:
	ln -si ${DOTFILES}/tmux ${HOME}/.config

link-zsh:
	ln -si ${DOTFILES}/zsh ${HOME}/.config/zsh

link-scripts:
	ln -si ${DOTFILES}/scripts/urldecode /usr/local/bin/urldecode
	ln -si ${DOTFILES}/scripts/urlencode /usr/local/bin/urlencode
	ln -si ${DOTFILES}/scripts/nvims /usr/local/bin/nvims
