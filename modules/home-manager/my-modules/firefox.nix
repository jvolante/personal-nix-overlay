{ lib, config, pkgs, ... }:
  with lib;
let
  cfg = config.programs.my-modules.firefox;
in
{
  options.programs.my-modules.firefox = {
    enable = mkEnableOption "My firefox config";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox;
      profiles.default = {
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          privacy-badger
          ublock-origin
          localcdn
          darkreader
          consent-o-matic
          clearurls
          bitwarden
          libredirect
        ];
        search = {
          default = "DuckDuckGo";
          force = true;
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "NixOS Wiki" = {
              urls = [ { template = "https://nixos.wiki/index.php?search={searchTerms}"; } ];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };
          };
        };
      };
    };
  };
}
