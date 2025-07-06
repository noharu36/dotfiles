{pkgs, ...}:

{
    programs.starship = {
        enable = true;
        settings = {
            add_newline = false;
            format = "$username$hostname$directory$git_branch$git_status $rust$package\n$battery$time\n$character";
            character = {
                success_symbol = "[>](bold blue)";
                error_symbol = "[x](bold red)";
            };
            time = {
                disabled = false;
                format = "🕐[ $time ]($style) ";
                time_format = "%T";
            };
            battery = {
                disabled = false;
                display = [
                    {
                        threshold = 100;
                        style = "bold green";
                    }
                ];
            };
        };
    };
}
