{
    programs.vscode = {
        profiles.default = {
            enableExtensionUpdateCheck = false;
            enableUpdateCheck = false;
            userSettings = {
                "[nix]"."editor.tabSize" = 4;
            };
        };
    };
}