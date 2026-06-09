{
    description = "Minha configuração Home Manager no Arch Linux";

    inputs = 
    {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        
        home-manager = 
        {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zen-browser = 
        {
            url = "github:youwen5/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, zen-browser, ... }@inputs:
    let
        system = "x86_64-linux";
        
        pkgs = import nixpkgs 
        {
            inherit system;

            config.allowUnfree = true;

            overlays = 
            [
                (final: prev: 
                    {
                        unstable = import nixpkgs-unstable 
                        {
                            inherit system;
                            config.allowUnfree = true;
                        };
                    }
                )
            ];
        };
    in 
    {
        homeConfigurations."cauaarch" = home-manager.lib.homeManagerConfiguration 
        {
            inherit pkgs;

            extraSpecialArgs = { inherit inputs; };

            modules = 
            [
                ./home.nix
            ];
        };
    };
}
