{ config, pkgs, ... }:

{
    programs.onlyoffice = 
    {
        enable = true;

        package = pkgs.unstable.onlyoffice-desktopeditors;
    };
}
