# FILE: .bashrc
# DESCRIPTION: Configures behavior of /bin/bash
# AUTHOR: Thomas Patton 

# --- GENERIC ---
# SET PS1
PS1="[\w]$ "

# ENVIRONMENT VARIABLES
export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH=/opt/homebrew/bin:$PATH

# ALIASES
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#alias ls="gls -FC"
alias wh=which
alias q=exit

# --- PROGRAMMING LANGUAGES ---
# RUST
. "$HOME/.cargo/env"


# --- WORK ---
# MODLALAI
alias voxl-cross="voxl-docker -i voxl-cross"
alias repos="cd ~/code/modalai/"

function deploy_voxl() {
    # Save the current directory
    local current_dir=$(pwd)
    # Change to the static directory
    cd ~/git/modalai/libmodal-cv/ || return 1
    # Run the script
    ./deploy_to_voxl.sh
    # Return to the starting directory
    cd "$current_dir"
}


deploy() {
  original_dir=$(pwd)

  # iterate over each provided argument
  for directory in "$@"; do
    # check if the argument is a valid directory
    if [ -d "$directory" ]; then
      # Change into the directory
      cd "$directory" || continue

      # run deploy voxl 
      ./deploy_to_voxl.sh

      # Change back to the original directory
      cd "$original_dir"
    else
      echo "Not a valid directory: $directory"
    fi
  done
}


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
