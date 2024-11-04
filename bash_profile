#-*-shell-script-*-

# Function returns whether a homebrew package was installed
#
homebrew_was_installed () {
    which brew && brew list | egrep "^${1}$" > /dev/null
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

# brew doctor complained about /usr/local/sbin not being on path
export PATH="/usr/local/sbin:$PATH"

# node version manager from homebrew
if homebrew_was_installed nvm; then
    export NVM_DIR=~/.nvm
    . $(brew --prefix nvm)/nvm.sh
fi

# python version manager from homebrew
if homebrew_was_installed pyenv; then
  eval "$(pyenv init -)"
fi

# pyenv's virtualenv plugin
if homebrew_was_installed pyenv-virtualenv; then
  eval "$(pyenv virtualenv-init -)"
fi

GPG_AGENT_OUTPUT=~/.gnupg/.gpg-agent-info
if [ -f $GPG_AGENT_OUTPUT ] && [ -n "$(pgrep gpg-agent)" ]; then
    source $GPG_AGENT_OUTPUT
else
    # enable gpg-agent if it is not running; save its env vars
    which gpg-agent && eval $(gpg-agent --daemon | tee $GPG_AGENT_OUTPUT)
fi

# source credential file that should not be committed
if [ -f $HOME/.nocommit_credentials ]; then
    source $HOME/.nocommit_credentials
fi

# source profile file that should not be committed
if [ -f $HOME/.nocommit_profile ]; then
    source $HOME/.nocommit_profile
fi

# default to python, ruby, or anaconda (set in .no_commit_profile)
if [[ $I_LOVE_PYTHON ]] ; then
    py
elif [[ $I_LOVE_RUBY ]] ; then
    rb
elif [[ $I_LOVE_ANACONDA ]] ; then

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/boscoso/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/boscoso/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/boscoso/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/boscoso/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

fi
