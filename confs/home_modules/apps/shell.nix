let

zshAliases = {
    # -----------------------------------------------------
    # General
    # -----------------------------------------------------
    c = "clear";
    shutdown = "systemctl poweroff";
    v = "neovim";
    vs = "sudo neovim";
    relob = "source ~/.zshrc";
    wifi = "nmtui";
    sysup = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    homeup = "home-manager switch --flake ~/.dotfiles";
    sysgc = "sudo nix-collect-garbage -d";
    homegc = "nix-collect-garbage -d";
    histc = "rm ~/.zsh_history";
};

in
{
    programs.zsh = {
        enable = true;
        autocd = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        shellAliases = zshAliases;
        history.size = 10000;
        history.save = 10000;
        dotDir = ".config/zsh";
        history = {
            expireDuplicatesFirst = true;
            path = "$HOME/.zsh_history";
            ignoreAllDups = true;
            saveNoDups = true;
        };
        initContent = ''
            eval "$(starship init zsh)"

            if [ -f ~/.zsh_history ]; then
                alias turnoff='sudo shutdown -h now && rm ~/.zsh_history'
            else
                alias turnoff='sudo shutdown -h now'
            fi

            if [[ $(tty) == *"pts"* ]]; then
                fastfetch --config examples/13
            else
                echo
                if [ -f /bin/hyprctl ]; then
                    echo "Start Hyprland with command Hyprland"
                fi
            fi
        '';
    };
}
