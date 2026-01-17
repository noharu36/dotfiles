{ config, pkgs, lib, ... }:

{
    programs.aerospace.settings = {
        gaps = {
            inner = {
                horizontal = 0;
                vertical = 0;
            };
            outer = {
                left = 0;
                right = 0;
                bottom = 0;
                top = [
                    { monitor."Panasonic-TV" = 35; }
                    10
                ];
            };
        };
    };
}
