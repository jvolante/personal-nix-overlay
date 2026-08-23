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
  cfg = config.components.my-modules.boilerplate-wayland;
in
{
  options.components.my-modules.boilerplate-wayland = {
    enable = mkEnableOption "My boilerplate-wayland config";
  };

  config = mkIf cfg.enable {
    xdg.configFile."electron-flags.conf" = {
      text = ''
        --enable-features=WaylandWindowDecorations
        --ozone-platform-hint=auto
      '';
    };
  };
}
