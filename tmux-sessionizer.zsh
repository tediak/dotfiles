#! /bin/zsh

tmux_session_prefix="󰬚"

args_length=$#

if [[ $args_length -ne 0 && $args_length -ne 1 ]]; then
  echo "Error: you can't specify more than 1 argument"
  exit 1
fi

if [[ $args_length -eq 1 ]]; then
  selected=$1
else
  # Get directories
  dirs=$(find ~ ~/.config ~/work ~/my -mindepth 0 -maxdepth 1 -type d)

  # Get tmux sessions with prefix
  sessions=$(tmux list-sessions -F "${tmux_session_prefix} #{session_name}" 2>/dev/null)

  # Combine and pick
  if [[ -n $sessions ]]; then
    combined=$(echo "$sessions"$'\n'"$dirs")
  else
    combined=$dirs
  fi
  selected=$( echo $combined | fzf --reverse )
fi

if [[ -z $selected ]]; then
  exit 1
fi


# echo "Selected value is $selected"

if [[ $selected == ${tmux_session_prefix}* ]]; then
  # Remove the tmux_session_prefix from the beginning of $selected
  session_name="${selected#${tmux_session_prefix} }"
  if [[ -z $TMUX ]]; then
    tmux attach -t "$session_name"
  else
    current_session=$(tmux display-message -p '#S')
    if [[ $current_session == $session_name ]]; then
      echo "We are already in session $session_name"
      exit 1
    fi
    tmux switch-client -t "$session_name"
  fi
  exit 0
fi

session_name=${${$(basename $selected):u}//./-}

# echo "Basename is $session_name"

if pgrep -x tmux &> /dev/null; then
  # echo "Tmux is running $tmux_running"
  if [[ -z $TMUX ]]; then
    # echo "We are outside of tmux. need to check if $session_name exists and create one. attach to the session otherwise."
    if tmux has-session -t $session_name &> /dev/null; then
      # echo "tmux already has session $session_name, attaching to it"
      tmux attach -t $session_name
    else
      tmux new-session -s $session_name -c $selected
    fi
  else
    # echo "We are inside of tmux. need to switch to $session_name"
    current_session=$(tmux display-message -p '#S')
    # echo "Current session is $current_session"
    if [[ $current_session == $session_name ]]; then
      echo "We are already in session $session_name"
      exit 1
    fi

    tmux new-session -d -s $session_name -c $selected
    tmux switch-client -t $session_name
  fi
else
  # echo "Tmux not running $tmux_running"
  tmux new-session -s $session_name -c $selected
fi
