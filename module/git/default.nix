{pkgs, ...}:

{
  programs.git = {
    enable = true;
    settings = {
        user = {
            name = "noharu36";
            email = "todofamily_h@icloud.com";
        };
    };
  };
}
