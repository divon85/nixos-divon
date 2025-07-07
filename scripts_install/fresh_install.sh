echo "Fresh install to $SCRIPT_DIR."
# ### Copy files
# ## Credit to MyLinux4Work
# echo "Copying files to $SCRIPT_DIR"
# if [ -f "$INSTALLER_DIR/"excludes.txt ]; then
#     rsync -avhp -I --exclude-from="$INSTALLER_DIR/"excludes.txt "$INSTALLER_DIR/." "$SCRIPT_DIR"
# else
#     rsync -avhp -I "$INSTALLER_DIR/." "$SCRIPT_DIR"
# fi

# sed -i "0,/igor/s//$(whoami)/" $SCRIPT_DIR/flake.nix
# sed -i "0,/Igor Novid/s//$(getent passwd $(whoami) | cut -d ':' -f 5 | cut -d ',' -f 1)/" $SCRIPT_DIR/flake.nix
# sed -i "s/igornovid@outlook.com//" $SCRIPT_DIR/flake.nix
# sed -i "s+~/.dotfiles+$SCRIPT_DIR+g" $SCRIPT_DIR/flake.nix

# ## Open up editor to manually edit flake.nix before install
# if [ -z "$EDITOR" ]; then
#     EDITOR=nano;
# fi
# $EDITOR $SCRIPT_DIR/flake.nix;
# $EDITOR $SCRIPT_DIR/confs/user_modules/wm/hyprland/conf/extraConfigs/monitor.nix;

# ## Copy hardware-configuration.nix
# if [ -f /etc/nixos/hardware-configuration.nix ]; then
#     echo "Copying hardware-configuration.nix to $SCRIPT_DIR"
#     cp /etc/nixos/hardware-configuration.nix "$SCRIPT_DIR/confs/system_modules/hardware-configuration.nix"
# else
#     echo "No hardware-configuration.nix found, skipping copy."
# fi

# ## Rebuild the system
# ## Credit to Librephoenix
# echo "Rebuilding the system with the new dotfiles"
# sudo nixos-rebuild switch --flake "$SCRIPT_DIR#nixhost"

# ## Install home-manager
# ## Credit to Librephoenix
# echo "Installing home-manager"
# nix run home-manager/master --extra-experimental-features 'nix-command flakes' -- switch --flake "$SCRIPT_DIR#nixuser"