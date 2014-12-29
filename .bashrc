[ -n "$PS1" ] && source ~/.bash_profile

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
