#-*-shell-script-*-

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
