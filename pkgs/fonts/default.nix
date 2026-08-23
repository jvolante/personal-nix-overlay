{
  pkgs ? (import ../nixpkgs.nix) { },
}: pkgs.callPackage ./endless.nix { }
