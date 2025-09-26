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
# alias vim="nvim "
alias nvimb="NVIM_APPNAME=nvim-back nvim "
alias v="nvim"

# Sublime *
alias text="subl"
alias merge="smerge"

# Bottom
alias btm="btm --celsius"

# TLauncher
alias tlauncher="java -Xms24g -Xmx24g -jar ~/my/tlauncher/TLauncher.jar"

# alias excalidraw_export="excalidraw_export --embed-fonts --rename-fonts"
alias notes="wordgrinder /Users/tediak/.notes/main.wg"

# m4b-tool
alias m4b-tool='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt sandreas/m4b-tool:latest'

# most
alias most="most -w"

# my personal utils
alias cheatsheets="nvim ~/.navi/cheats/tdk"
alias finance="nvim ~/my/finance"
