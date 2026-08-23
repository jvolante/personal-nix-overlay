{
  lib,
  config,
  pkgs,
  ...
}:
  with lib;
let
  cfg = config.components.my-modules.hyprland;
in
{
  options.components.my-modules.hyprland = {
    enable = mkEnableOption "My hyprland config";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      "$mod" = "SUPER";
      "$terminal" = "${config.programs.wezterm.package}/bin/wezterm";

      bind = [
        "$mod, w, exec, ${config.programs.firefox.package}/bin/firefox"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (
          builtins.genList (
            x:
            let
              ws =
                let
                  c = (x + 1) / 10;
                in
                builtins.toString (x + 1 - (c * 10));
            in
            [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          ) 10
        )
      );
    };
    programs.wofi = {
      enable = true;
    };
    services.dunst = {
      enable = true;
    };
  };
}
