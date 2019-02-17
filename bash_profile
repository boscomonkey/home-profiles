#-*-shell-script-*-

# whether a homebrew package has been installed; also returns false if
# homebrew is not installed
homebrew_has_installed () {
    # error messages appear on STDERR; so pipe that to null to fail conditional
    [ -n "$(brew --prefix $1 2>/dev/null)" ]
}

# node version manager from homebrew
if homebrew_has_installed nvm; then
    export NVM_DIR=~/.nvm
    . $(brew --prefix nvm)/nvm.sh
fi

# python version manager from homebrew
if homebrew_has_installed pyenv; then
  eval "$(pyenv init -)"
fi

# .bash_profile is for making sure that both the things in .profile and .bashrc are loaded
# for login shells.

if [ -e ~/.profile ]
then
    source ~/.profile
fi

if [ -e ~/.bashrc ]
then
    source ~/.bashrc
fi

# if pyenv is installed, initialize it
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

GPG_AGENT_OUTPUT=~/.gnupg/.gpg-agent-info
if [ -f $GPG_AGENT_OUTPUT ] && [ -n "$(pgrep gpg-agent)" ]; then
    source $GPG_AGENT_OUTPUT
else
    # enable gpg-agent if it is not running; save its env vars
    eval $(gpg-agent --daemon | tee $GPG_AGENT_OUTPUT)
fi

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
