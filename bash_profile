#-*-shell-script-*-

# Function returns whether a homebrew package was installed
#
homebrew_was_installed () {
    brew list | egrep "^${1}$" > /dev/null
}


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

# node version manager from homebrew
if homebrew_was_installed nvm; then
    export NVM_DIR=~/.nvm
    . $(brew --prefix nvm)/nvm.sh
fi

# python version manager from homebrew
if homebrew_was_installed pyenv; then
  eval "$(pyenv init -)"
fi

GPG_AGENT_OUTPUT=~/.gnupg/.gpg-agent-info
if [ -f $GPG_AGENT_OUTPUT ] && [ -n "$(pgrep gpg-agent)" ]; then
    source $GPG_AGENT_OUTPUT
else
    # enable gpg-agent if it is not running; save its env vars
    eval $(gpg-agent --daemon | tee $GPG_AGENT_OUTPUT)
fi

# source credential file that should not be committed
if [ -f .nocommit_credentials ]; then
    source .nocommit_credentials
fi

# source profile file that should not be committed
if [ -f .nocommit_profile ]; then
    source .nocommit_profile
fi
