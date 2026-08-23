{
  description = "Public NixOS and Home Manager modules";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      stylix,
    }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ];

      pkgs = nixpkgs.legacyPackages;

      pkgsOverlay = final: prev:
        let
          customPkgs = import ./pkgs { pkgs = final; };
        in
        customPkgs;

      pkgSet = import ./pkgs { pkgs = nixpkgs.legacyPackages.x86_64-linux; };
    in
    {
      lib = import ./lib { pkgs = nixpkgs; };

      packages = forAllSystems (
        sys:
        let
          systemPkgs = pkgs.${sys};
        in
        import ./pkgs { pkgs = systemPkgs; }
      );

      overlays = { default = pkgsOverlay; };

      packagesOverlays = { default = pkgSet; };

      nixosModules = {
        default = { config, lib, ... }:
          {
            imports = lib.filesystem.listFilesRecursive ./modules/nixos;
          };
      };

      homeModules = {
        default = { config, lib, ... }:
          {
            imports = lib.filesystem.listFilesRecursive ./modules/home-manager;
          };
      };

      formatter = forAllSystems (
        sys:
        let
          pkgs = nixpkgs.legacyPackages.${sys};
        in
        pkgs.nixfmt-tree
      );

    };
}
