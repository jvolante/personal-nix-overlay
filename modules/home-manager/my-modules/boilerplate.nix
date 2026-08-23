{
  lib,
  config,
  inputs,
  outputs,
  pkgs,
  ...
}:
  with lib;
let
  cfg = config.components.my-modules.boilerplate;
in
{
  options.components.my-modules.boilerplate = {
    enable = mkEnableOption "My boilerplate config";
  };

  config = mkIf cfg.enable {
    programs.bash.enable = true;
    programs.home-manager.enable = true;

    systemd.user.startServices = "sd-switch";
  };
}
