{ lib, config, ... }:
  with lib;
let
  cfg = config.programs.my-modules.fzf;
in
{
  options.programs.my-modules.fzf = {
    enable = mkEnableOption "My fzf config";
  };

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
