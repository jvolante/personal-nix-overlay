{ lib, config, ... }:
  with lib;
let
  cfg = config.programs.my-modules.parallel;
in
{
  options.programs.my-modules.parallel = {
    enable = mkEnableOption "My parallel config";
  };

  config = mkIf cfg.enable {
    programs.parallel = {
      enable = true;
      will-cite = true;
    };
  };
}
