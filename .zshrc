export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

# The next line is an alias to clean up stopped docker containers
alias dockerrm="docker rm -v $(docker ps -aq -f status=exited)"

# The next line sets the locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#alias k="kubectl"
#setopt nocorrectall;
#if [[ $- = *i* ]]; then
#  declare -i __agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
#  if [ "$SSH_AUTH_SOCK" -a $__agent_run_state -eq 1 ]; then
#    ssh-add -A
#  fi
#  unset __agent_run_state
#fi
