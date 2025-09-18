DOTFILES="~/my/dotfiles"

tmux-reload:
	tmux source-file tmux/tmux.conf

link-ghostty:
	ln -si ${DOTFILES}/ghostty/config "${HOME}/Library/Application Support/com.mitchellh.ghostty/config"
