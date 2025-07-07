echo "Copying the configs to $SCRIPT_DIR."
# rsync -avhp -I \
#     --exclude-from="$INSTALLER_DIR/"excludes.txt \
#     --files-from="$INSTALLER_DIR/"includes.txt \
#     "$INSTALLER_DIR/." "$SCRIPT_DIR"