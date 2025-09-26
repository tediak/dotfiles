# # oh-my-posh
# POSH_THEME="$HOME/.config/zsh/prompts/oh-my-posh/kali.omp.json"
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   eval "$(oh-my-posh init --config $POSH_THEME zsh)"
# fi

git_segment() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  local branch
  branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) \
    || branch=$(git rev-parse --short HEAD 2>/dev/null) || return

  local line x y staged_added=0 staged_deleted=0 unstaged_added=0 unstaged_deleted=0
  while IFS= read -r line; do
    [[ $line == '??'* ]] && ((unstaged_added++)) && continue
    x=${line[1]} y=${line[2]}
    case $x in A|M|R|C) ((staged_added++));; D) ((staged_deleted++));; esac
    case $y in M) ((unstaged_added++));; D) ((unstaged_deleted++));; esac
  done < <(git status --porcelain 2>/dev/null)

  local seg="%F{4}-[%f%F{magenta}${branch}%f"
  ((unstaged_added))   && seg+=" %F{red}+${unstaged_added}%f"
  ((unstaged_deleted)) && seg+=" %F{red}-${unstaged_deleted}%f"
  ((staged_added))     && seg+=" %F{green}+${staged_added}%f"
  ((staged_deleted))   && seg+=" %F{green}-${staged_deleted}%f"
  seg+="%F{4}]%f"
  print -r -- "$seg"
}

aws_segment() {
  local seg=""
  if [[ -n $AWS_PROFILE ]]; then
    seg+=" %F{8}aws:$AWS_PROFILE"
    [[ -n $AWS_REGION ]] && seg+="($AWS_REGION)"
    seg+="%f"
  fi
  print -r -- "$seg"
}

PROMPT_NODE_VERSION=$(node -v 2>/dev/null)
node_segment() {
  local seg=""
  if [[ -n $NVM_DIR ]]; then
    local node_version
    node_version=$(node -v 2>/dev/null)
    if [[ -n $PROMPT_NODE_VERSION ]]; then
      seg+=" %F{8}node:$node_version%f"
    fi
  fi
  print -r -- "$seg"
}

PROMPT_GO_VERSION=$(go version 2>/dev/null | awk '{print $3}' | sed 's/^go/v/')
go_segment() {
  if [[ -n $PROMPT_GO_VERSION ]]; then
    print -r -- " %F{8}go:${PROMPT_GO_VERSION}%f"
  fi
}

setopt PROMPT_SUBST
PROMPT=$'%F{4}[%f%F{blue}%4~%f%F{4}]%f$(git_segment) %B%F{%(?.blue.red)}λ%f%b '
RPROMPT=$'$(aws_segment)$(node_segment)$(go_segment)'
