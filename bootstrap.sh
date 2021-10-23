#!/usr/bin/env bash

DOTFILES_SRC="dotfiles"
BACKUP_EXISTING_DIR="bak.dotfiles"

echo "[MIGRATING DOTFILES TO CURRENT SYSTEM]"

# change to the $HOME directory as the destination for the dotfiles
cd $HOME
for SUBDIR in $(find $DOTFILES_SRC -mindepth 1 -maxdepth 1); do
    # don't symlink .git directory
    [ $SUBDIR = "$DOTFILES_SRC/.git" ] && continue
    for DOTFILE_PATH in $(find $SUBDIR -mindepth 1 -maxdepth 1); do
        # get filename of the dotfile
        DOTFILE=$(basename $DOTFILE_PATH)
        # don't symlink .gitignore files
        [ $DOTFILE = ".gitignore" ] && continue
        echo "[SYMLINKING $DOTFILE]"
        # if this dotfile already exists in $HOME
        if [ -e $DOTFILE ]
        then
            # if the file is a symlink, remove it, otherwise move it do a backup directory for later retrieval
            if [ -L $DOTFILE ]
            then
                rm $DOTFILE
            else
                echo "[BACKING UP EXISTING DOTFILE $DOTFILE to ~/$BACKUP_EXISTING_DIR]" && mkdir -p $BACKUP_EXISTING_DIR && mv $DOTFILE bak.dotfiles
            fi
        fi
        # make symbolic link, overwriting if the symlink already exists
        ln --symbolic --force --verbose $DOTFILE_PATH $DOTFILE
    done
done
echo "[DONE]"
