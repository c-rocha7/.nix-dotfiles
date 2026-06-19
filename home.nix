{ config, pkgs, inputs, ... }:

{
    home = 
    {
        username = "cauaarch";
        homeDirectory = "/home/cauaarch";
        stateVersion = "26.05";
        packages =
        [
            inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
    };

    imports = 
    [
        ./modules
    ];

    nix.gc = 
    {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };

    programs.home-manager.enable = true;
    targets.genericLinux.enable = true;
}
