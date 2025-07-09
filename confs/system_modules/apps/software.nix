{ pkgs, ... }: {
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        # Base
        neovim                                          #text editor
        wget                                            #terminal downloader
        git                                             # You know la...!!!
        alacritty                                       # Terminal
        zsh                                             # Shell engine
        wpgtk                                           # Color scheming
        python3                                         # still need comment?
        (ffmpeg-full.override { withUnfree = true; })   # Media codec
        fastfetch                                       # its fun
        ntfs3g                                          # mount and write ntfs drive
        starship                                        # terminal styling
        brightnessctl                                   # Adjust screen brightness
        pipewire                                        # Sound
        pwvucontrol                                     # Pipewire volume control
        file                                            # Program that shows the type of files
        p7zip                                           # Archive extraction and preview
        jq                                              # JSON preview
        poppler                                         # PDF viewer
        fd                                              # Fast file search
        ripgrep                                         # Fast text search
        fzf                                             # Fuzzy finder
        zoxide                                          # Fuzzy finder for command history
        resvg                                           # SVG rendering library
        imagemagick                                     # Image manipulation


        # File Manager
        yazi                                            # Terminal file manager
        gvfs                                            # For trash support, mounts

        # Apps
        grimblast                                       # Screenshot tools



        # Programming Language
        libgcc                                          # C and C++
        julia                                           # Julia programming
        conda
    ];
    
    programs.zsh.enable = true;
    programs.nix-ld.enable = true;
}
