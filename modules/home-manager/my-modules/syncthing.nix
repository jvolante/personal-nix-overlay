{ lib, config, ... }:
  with lib;
let
  cfg = config.programs.my-modules.syncthing;
in
{
  options.programs.my-modules.syncthing = {
    enable = mkEnableOption "My syncthing config";
  };

  config = mkIf cfg.enable {
    services.syncthing = {
      enable = true;
    };
  };
}
