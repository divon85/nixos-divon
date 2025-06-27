#!/bin/sh

# Automated installation script for the dotfiles

## Copy downloaded files to the dotfiles directory
# Clone dotfiles
if [ $# -gt 0 ]
    then
        SCRIPT_DIR=$1
    else
        SCRIPT_DIR=~/.dotfiles
fi

if [ -d "$SCRIPT_DIR" ]; then
    echo "Removing existing dotfiles directory at $SCRIPT_DIR"
    rm -rf "$SCRIPT_DIR"
fi