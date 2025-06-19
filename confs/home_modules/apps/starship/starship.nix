{
    imports = [
        ./modules/aws.nix
        ./modules/battery.nix
        ./modules/buf.nix
        ./modules/c.nix
        ./modules/character.nix
        ./modules/cmake.nix
        ./modules/cmd_duration.nix
        ./modules/cobol.nix
        ./modules/conda.nix
        ./modules/directory.nix
        ./modules/dotnet.nix
        ./modules/env_var.nix
        ./modules/git.nix
        ./modules/julia.nix
        ./modules/nix_shell.nix
        ./modules/php.nix
        ./modules/python.nix
        ./modules/shell.nix
        ./modules/status.nix
        ./modules/sudo.nix
        ./modules/time.nix
        ./modules/username.nix
    ];
    programs.starship = {
        enable = true;
        settings = {
            # add_newline = true;
            # command_timeout = 500;
            # continuation_prompt = "[∙](bright-black) ";
            # format = "[](0x9A348E)$username$hostname$localip$shlvl$singularity$kubernetes[](fg:0x9A348E bg:0xDA627D)$directory$vcsh[](fg:0xDA627D bg:0xFCA17D)$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch[](fg:0x86BBD8 bg:0x06969A)$docker_context$package$buf[](fg:0xFCA17D bg:0x86BBD8)$c$cmake$cobol$container$daml$dart$deno$dotnet$elixir$elm$erlang$golang$haskell$helm$java$julia$kotlin$lua$nim$nodejs$ocaml$perl$php$pulumi$purescript$python$rlang$red$ruby$rust$scala$swift$terraform$vlang$vagrant$zig$nix_shell$conda$spack$memory_usage$aws$gcloud$openstack$azure$env_var$crystal$custom$sudo$cmd_duration$line_break$jobs$battery[](fg:0x06969A bg:0x33658A)$time$status$shell$character";
            # right_format = "";
            # scan_timeout = 30;
            format = "
            [](#9A348E)
            $username\
            $hostname\
            $directory\
            $git_branc\
            $git_status\
            $cmd_duration\
            $time\
            $line_break\
            $character";

            add_newline = false;

        };
    };
}