DOTFILES=${HOME}/my/dotfiles

tmux-reload:
	tmux source-file tmux/tmux.conf

link-ghostty:
	ln -si ${DOTFILES}/ghostty/config "${HOME}/Library/Application Support/com.mitchellh.ghostty/config"

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
