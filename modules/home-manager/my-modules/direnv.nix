{
  lib,
  config,
  ...
}:
  with lib;
let
  cfg = config.programs.my-modules.direnv;
in
{
  options.programs.my-modules.direnv = {
    enable = mkEnableOption "My direnv config";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      enableFishIntegration = false;

      nix-direnv.enable = true;
    };
  };
}
