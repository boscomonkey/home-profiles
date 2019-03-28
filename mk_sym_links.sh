#!/bin/sh

dirname=$(dirname "$0")

for file in \
    bash_aliases \
    bash_logout \
    bash_profile \
    bashrc \
    emacs \
    emacs.d \
    gemrc \
    git-prompt.conf \
    gitconfig \
    profile \
    pyutils.sh
do
    DEST=".$file"
    SRC="$dirname/$file"

    # ls -d "$DEST"
    # ls -d "$SRC"
    ln -s "$SRC" "$DEST"
done
