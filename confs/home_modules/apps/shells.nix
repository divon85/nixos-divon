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
        history.path = "$HOME/.zsh_history";
        initContent = ''
            eval "$(starship init zsh)"

            if [ -f ~/.zsh_history ]; then
                alias histc='rm ~/.zsh_history && history -c'
            else
                alias histc='history -c'
            fi

            if [ -f ~/.zsh_history ]; then
                alias turnoff='rm ~/.zsh_history && history -c && sudo shutdown -h now'
            else
                alias turnoff='history -c && sudo shutdown -h now'
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