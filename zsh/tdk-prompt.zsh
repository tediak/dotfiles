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

  local seg="%F{2}[%f%F{blue}${branch}%f"
  ((unstaged_added))   && seg+=" %F{red}+${unstaged_added}%f"
  ((unstaged_deleted)) && seg+=" %F{red}-${unstaged_deleted}%f"
  ((staged_added))     && seg+=" %B%F{green}+${staged_added}%f%b"
  ((staged_deleted))   && seg+=" %B%F{green}-${staged_deleted}%f%b"
  seg+="%F{2}]%f"
  print -r -- "$seg"
}

setopt PROMPT_SUBST
PROMPT=$'%F{2}[%f%F{blue}%4~%f%F{2}]%f\n %B%F{3}%(!.#.λ)%f%b '
RPROMPT=$'$(git_segment)'
