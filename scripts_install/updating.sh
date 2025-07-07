echo "Fresh install to $SCRIPT_DIR."
# ### Copy files
# ## Credit to MyLinux4Work
# echo "Copying files to $SCRIPT_DIR"
# rsync -avhp -I \
#     --exclude-from="$INSTALLER_DIR/"excludes.txt \
#     --files-from="$INSTALLER_DIR/"includes.txt \
#     "$INSTALLER_DIR/." "$SCRIPT_DIR"

# ## Rebuild the system
# ## Credit to Librephoenix
# echo "Rebuilding the system with the new dotfiles"
# sudo nixos-rebuild switch --flake "$SCRIPT_DIR#nixhost"

# ## Install home-manager
# ## Credit to Librephoenix
# echo "Installing home-manager"
# home-manager switch --flake "$SCRIPT_DIR#nixuser"