{
  lib,
  config,
  pkgs,
  ...
}:
  with lib;
let
  cfg = config.programs.my-modules.gnome;
in
{
  options.programs.my-modules.gnome = {
    enable = mkEnableOption "My gnome config";
  };

  config = mkIf cfg.enable {
    xdg.configFile."Trolltech.conf".text = ''
      [Qt]
      style=GTK+
    '';
    gtk = {
      enable = true;

      font = {
        package = pkgs.raleway;
        name = "Raleway Medium";
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      theme = {
        name = "Orchis-Purple-Dark-Compact";
        package = pkgs.orchis-theme;
      };

      cursorTheme = {
        name = "Numix-Cursor";
        package = pkgs.numix-cursor-theme;
      };

      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };

      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=1
        '';
      };
    };

    home.sessionVariables.GTK_THEME = "Orchis-Purple-Dark-Compact";
    home.sessionVariables.XCURSOR_THEME = "Numix-Cursor";

    home.packages = [
      pkgs.gnomeExtensions.user-themes
      pkgs.gnomeExtensions.space-bar
    ];

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
      };
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file://" + toString ../../resources/wallpaper.jpg;
        primary-color = "#3a4ba0";
        secondary-color = "#2f302f";
      };
      "org/gnome/desktop/screensaver" = {
        picture-uri = "file://" + toString ../../resources/wallpaper.jpg;
        primary-color = "#3a4ba0";
        secondary-color = "#2f302f";
      };
      "org/gnome/shell" = {
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "firefox.desktop"
          "org.wezfurlong.wezterm.desktop"
          "logseq.desktop"
        ];

        enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "space-bar@luchrioh"
        ];
      };
    };
  };
}
