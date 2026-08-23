{ lib, config, pkgs, ... }:
  with lib;
let
  cfg = config.programs.my-modules.mpv;
in
{
  options.programs.my-modules.mpv = {
    enable = mkEnableOption "My mpv config";
  };

  config = mkIf cfg.enable {
    xdg.configFile."mpv/mpv.conf".text = ''
      hwdec=auto-safe
      vo=gpu
      profile=gpu-hq
      gpu-context=wayland
    '';
  };
}
