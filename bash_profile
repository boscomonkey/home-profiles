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

