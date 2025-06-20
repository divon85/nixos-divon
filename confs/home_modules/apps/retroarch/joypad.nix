{
    (final: prev: {
        retroarch-joypad-autoconfig = prev.retroarch-joypad-autoconfig.overrideAttrs {
            src = prev.fetchFromGitHub {
                owner = "ibizaman";
                repo = "retroarch-joypad-autoconfig";
                rev = "420a8fa4dc7b12f7c176fa0e704e9f987f6ceabd";
                hash = "sha256-yIvW9UTgc+/hhwx+93FgzrDBEBD35xFdBiVdJCKUYBc=";
            };
        };
    })
}