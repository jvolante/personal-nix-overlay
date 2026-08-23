{
  pkgs ? (import ../nixpkgs.nix) { },
}: {
  endless-font = pkgs.callPackage ./fonts/endless.nix { };
}
