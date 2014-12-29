# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for openvpn configs based on ~/.openvpn/config, ignoring wildcards
[ -e "$HOME/.openvpn/config/" ] && complete -o "default" -o "nospace" -W "$(find ~/.openvpn/config/ -name "*.ovpn" )" openvpn

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm
[[ -s "$HOME/.nvm/nvm.sh" ]]      && source $HOME/.nvm/nvm.sh

[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source $HOME/perl5/perlbrew/etc/bashrc

export PATH=$PATH:/usr/sbin:/sbin

eval `dircolors ~/.dir_colors`
