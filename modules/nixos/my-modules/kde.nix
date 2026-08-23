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
  cfg = config.components.my-modules.kde;
in
{
  options.components.my-modules.kde = {
    enable = mkEnableOption "My kde config";
  };

  config = mkIf cfg.enable {
    services.xserver.enable = false;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      # okular
      oxygen
      khelpcenter
      # print-manager
      kmail
    ];

    services.displayManager.defaultSession = "plasma";
    services.displayManager.sddm.wayland.enable = true;
    services.displayManager.sddm.wayland.compositor = "kwin";

    programs.kdeconnect.enable = true;

    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
