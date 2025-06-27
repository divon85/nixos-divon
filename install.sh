#!/bin/sh

# Automated installation script for the dotfiles

## Copy downloaded files to the dotfiles directory
### Check directory
## Credit to Librephoenix
INSTALLER_DIR="$(dirname "$(realpath "$0")")"
if [ $# -gt 0 ]
    then
        SCRIPT_DIR=$1
    else
        SCRIPT_DIR=~/.dotfiles
fi

### Remove existing dotfiles directory
if [ -d "$SCRIPT_DIR" ]; then
    echo "Removing existing dotfiles directory at $SCRIPT_DIR"
    rm -rf "$SCRIPT_DIR"
fi

### Copy files
## Credit to MyLinux4Work
echo "Copying files to $SCRIPT_DIR"
if [ -f "$INSTALLER_DIR/"excludes.txt ]; then
    rsync -avhp -I --exclude-from="$INSTALLER_DIR/"excludes.txt "$INSTALLER_DIR/." "$SCRIPT_DIR"
else
    rsync -avhp -I "$INSTALLER_DIR/." "$SCRIPT_DIR"
fi

## Check bootloader
## Credit to Librephoenix
if [ -d /sys/firmware/efi/efivars ]; then
    sed -i "0,/bootMode.*=.*\".*\";/s//bootMode = \"uefi\";/" $SCRIPT_DIR/flake.nix
else
    sed -i "0,/bootMode.*=.*\".*\";/s//bootMode = \"bios\";/" $SCRIPT_DIR/flake.nix
    grubDevice=$(findmnt / | awk -F' ' '{ print $2 }' | sed 's/\[.*\]//g' | tail -n 1 | lsblk -no pkname | tail -n 1 )
    sed -i "0,/grubDevice.*=.*\".*\";/s//grubDevice = \"\/dev\/$grubDevice\";/" $SCRIPT_DIR/flake.nix
fi

## Patch flake.nix with different username/name and remove email by default
## Credit to Librephoenix
sed -i "0,/igor/s//$(whoami)/" $SCRIPT_DIR/flake.nix
sed -i "0,/Igor Novid/s//$(getent passwd $(whoami) | cut -d ':' -f 5 | cut -d ',' -f 1)/" $SCRIPT_DIR/flake.nix
sed -i "s/igornovid@outlook.com//" $SCRIPT_DIR/flake.nix
sed -i "s+~/.dotfiles+$SCRIPT_DIR+g" $SCRIPT_DIR/flake.nix

## Open up editor to manually edit flake.nix before install
if [ -z "$EDITOR" ]; then
    EDITOR=nano;
fi
$EDITOR $SCRIPT_DIR/flake.nix;

## Copy hardware-configuration.nix
if [ -f /etc/nixos/hardware-configuration.nix ]; then
    echo "Copying hardware-configuration.nix to $SCRIPT_DIR"
    cp /etc/nixos/hardware-configuration.nix "$SCRIPT_DIR/confs/system_modules/hardware-configuration.nix"
else
    echo "No hardware-configuration.nix found, skipping copy."
fi

## Rebuild the system
## Credit to Librephoenix
echo "Rebuilding the system with the new dotfiles"
sudo nixos-rebuild switch --flake "$SCRIPT_DIR#nixhost"

## Install home-manager
## Credit to Librephoenix
echo "Installing home-manager"
nix run home-manager/master --extra-experimental-features 'nix-command flakes' -- switch --flake "$SCRIPT_DIR#nixuser"
