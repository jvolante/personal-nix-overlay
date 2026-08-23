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
  cfg = config.components.my-modules.cli-apps;
in
{
  options.components.my-modules.cli-apps = {
    enable = mkEnableOption "My cli-apps config";
  };

  config = mkIf cfg.enable {
    components.my-modules.boilerplate.enable = true;

    programs.my-modules.starship.enable = true;
    programs.my-modules.git.enable = true;
    programs.my-modules.fzf.enable = true;
    programs.my-modules.parallel.enable = true;

    home.packages = with pkgs; [
      outfieldr
      pijul
      typst
      dust
      ripgrep
      sd
      fd
      nix-tree
      caligula
      pastel
      libnotify
      qrencode
      lnav
      ast-grep
      csope
      bottom
      fq
      jq
      jaq # jq like with slightly different semantics, slightly faster, supports most structured text formats
      #lemmeknow # string identification
      #euporie # terminal jupyter notebooks
      #castero # podcast manager
    ];

    services.tldr-update = {
      enable = true;
      package = pkgs.outfieldr;
    };

    home.shellAliases = {
      e = "$EDITOR";
    };

    programs.bash = {
      enable = true;
      shellOptions = [ "globstar" ];
      enableVteIntegration = true;
      bashrcExtra = ''
        nps () {
          ${pkgs.nix}/bin/nix search nixpkgs "$1" | ${pkgs.less}/bin/less
        }
      '';
    };
    home.file.".editorconfig".source = ../../../.editorconfig;
  };
}
