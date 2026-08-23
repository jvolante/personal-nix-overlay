{ lib, config, pkgs, inputs, ... }:
  with lib;
let
  cfg = config.components.my-modules.stylix;
in
{
  imports = [ inputs.stylix.homeModules.stylix ];

  options.components.my-modules.stylix = {
    enable = mkEnableOption "My stylix config";
  };

  config = mkIf cfg.enable {
    stylix.enable = true;
    # stylix.image = pkgs.fetchurl {
    #   url = "https://github.com/linkfrg/wallpapers/blob/main/nature/purple.jpg?raw=true";
    #   sha256 = "sha256-7RLhcvvUttaGnvxOjP5RKs3OPAOJXZPuNNeElY3szrg=";
    # };
    stylix.image = ../../../assets/images/wallpaper.jpg;

    stylix.polarity = "dark";
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    stylix.fonts = {
      sansSerif = {
        package = pkgs.raleway;
        name = "Raleway Medium";
      };
      serif = {
        package = pkgs.prata;
        name = "Prata Regular";
      };
      # monospace = {
      #   package = pkgs.cozette;
      #   name = "Cozette";
      # };
      monospace = {
        package = (pkgs.nerdfonts.override { fonts = [ "VictorMono" ]; });
        name = "Victor Mono Medium";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    # stylix.targets.gtk.enable = lib.mkForce false;
    stylix.targets.gnome.enable = lib.mkForce false;
  };
}
