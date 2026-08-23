{ lib, config, pkgs, ... }:
  with lib;
let
  cfg = config.programs.my-modules.helix;
in
{
  options.programs.my-modules.helix = {
    enable = mkEnableOption "My helix config";
  };

  config = mkIf cfg.enable {
    programs.helix = {
      enable = true;
      extraPackages = with pkgs; [
        marksman
        taplo
      ];
      settings = {
        theme = "catpuccin_frappe";
        editor = {
          scrolloff = 10;
          line-number = "none";
          auto-pairs = false;
        };
      };
    };
  };
}
