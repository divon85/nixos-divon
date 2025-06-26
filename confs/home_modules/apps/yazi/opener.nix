{
    programs.yazi = {
        settings = {
            opener = {
                edit = [{
                    run = "nvim '$@'";
                    block = true;
                    for = "unix";
                }];
            };
        };
    };
}