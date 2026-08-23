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
  cfg = config.components.my-modules.gpg-agent;
in
{
  options.components.my-modules.gpg-agent = {
    enable = mkEnableOption "My gpg-agent config";
  };

  config = mkIf cfg.enable {
    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      sshKeys = [
        "808180EC00E7FB7F89C711831E04B39D73996147"
      ];
    };
  };
}
