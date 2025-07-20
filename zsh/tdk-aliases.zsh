# Zoxide
alias cd="z"

# System
alias add-divider-to-dock="defaults write com.apple.dock persistent-apps -array-add '{\"tile-type\"=\"spacer-tile\";}'; killall Dock"

# Zsh
alias zconf="nvim ~/.zshrc"
alias zdir="cd ~/.config/zsh"
alias zprompt="nvim ~/.config/zsh/tdk-prompt.zsh"
alias zalias="nvim ~/.config/zsh/tdk-aliases.zsh"
alias zhome="nvim ~/.config/zsh/tdk-home.zsh"
alias zso="source ~/.zshrc"

# Neovim Editor
alias vim="nvim "
alias nvimb="NVIM_APPNAME=nvim-back nvim "
alias v="vim"

# Sublime *
alias text="subl"
alias merge="smerge"

# Bottom
alias btm="btm --celsius"

# TLauncher
alias tlauncher="java -Xms24g -Xmx24g -jar ~/my/tlauncher/TLauncher.jar"
