{
    config = {
        users = {
            nixos = {
                username = "harukun";
                homeDirectory = "/home/harukun";
            };
            darwin = {
                username = "noharu";
                homeDirectory = "/Users/noharu";
            };
        };
    };

    system = {
        # nixosStateVersion = "24.11";
        homeStateVersion = "25.11";
    };
}
