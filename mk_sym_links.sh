#!/bin/sh

REPO_HOME=$(dirname "$0")

for file in \
    bash_custom \
    emacs \
    gitconfig
do
    DEST=".$file"
    SRC="$REPO_HOME/$file"

    ln -s "$SRC" "$DEST"
done

# Handle directories differently by first checking if the destination
# exists. If we don't make this check AND we call this script again, a
# symbolic link will be made inside the directory - NOT what we want.

for dir in \
    emacs.d
do
    DEST=".$dir"
    SRC="$REPO_HOME/$dir"

    if test -s "${DEST}" || test -d "${DEST}"; then
	echo ERROR: \""${DEST}"\" exists. Stopping.
	exit 1
    fi

    ln -s "$SRC" "$DEST"
done
