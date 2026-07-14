{ ... }:

{
  flake.homeModules =
    {
      /*---- Programs ----*/
      nil = ./features/programs/_nil.nix;
      nixd = ./features/programs/_nixd.nix;
      nixpkgs-fmt = ./features/programs/_nixpkgs-fmt.nix;
      obsidian = ./features/programs/_obsidian.nix;
      vesktop = ./features/programs/_vesktop.nix;
      zen = ./features/programs/_zen.nix;

      /*---- Wrappers ----*/
      btop = ./features/wrappers/_btop.nix;
    };
}
