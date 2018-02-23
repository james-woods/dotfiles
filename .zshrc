export ZSH=~/.zsh
# The next lines initialize rbenv
eval "$(rbenv init -)"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/tobiasfeldhaus/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/tobiasfeldhaus/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/tobiasfeldhaus/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/tobiasfeldhaus/google-cloud-sdk/completion.zsh.inc'
fi

# The next line updates PATH for anaconda3
#export PATH=~/anaconda3/bin:"$PATH"

# The next line updates PATH for LaTeX
export PATH=$PATH:/Library/TeX/Distributions/Programs/texbin

# The next line updates PATH for go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/go

# The next line sets Java HOME
#export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home'

alias k="kubectl"
setopt nocorrectall;
if [[ $- = *i* ]]; then
  declare -i __agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
  if [ "$SSH_AUTH_SOCK" -a $__agent_run_state -eq 1 ]; then
    ssh-add -A
  fi
  unset __agent_run_state
fi
