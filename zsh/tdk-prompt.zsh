# oh-my-posh
POSH_THEME="$HOME/.config/zsh/prompts/oh-my-posh/kali.omp.json"
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init --config $POSH_THEME zsh)"
fi
