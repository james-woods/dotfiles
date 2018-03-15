export ZSH=~/.zsh

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

# The next line adds Go binaries to the PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tkaymak/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tkaymak/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tkaymak/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tkaymak/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line loads k8s aliases
[ -f ~/.kubectl_aliases  ] && source ~/.kubectl_aliases
func kubectl(){ echo "+ kubectl $@"; command kubectl $@  }

