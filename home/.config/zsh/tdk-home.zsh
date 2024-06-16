export LANG=en_US.UTF-8

# Misc
autoload -Uz compinit
compinit

# Syntax highlighting
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Autosuggestions
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# History search by subsctring
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=green,bold"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=red,bold"
source $ZSH/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
bindkey '^[[A' history-substring-search-up   # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'

# Vi mode
source $ZSH/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Manuals
export MANPATH="/usr/local/man:$MANPATH"

# NVM
export PATH="$NVM_BIN:$PATH"
source $ZSH/nvm/nvm.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Haskell
[ -f "/Users/tediak/.ghcup/env" ] && source "/Users/tediak/.ghcup/env" # ghcup-env
# Fuzzy finder
source ~/.fzfrc

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 17.0.10`

# Sublime Text and Merge
# To run from terminal: subl / smerge
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/Applications/Sublime Merge.app/Contents/SharedSupport/bin:$PATH"

# Golang
export GOPATH="$HOME/.config/go"
export PATH="$GOPATH/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tediak/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tediak/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tediak/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tediak/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ITerm2 shell integration
test -e "${HOME}/.config/.iterm2_shell_integration.zsh" && source "${HOME}/.config/.iterm2_shell_integration.zsh"
