{ lib, config, ... }:
  with lib;
let
  cfg = config.programs.my-modules.git;
in
{
  options.programs.my-modules.git = {
    enable = mkEnableOption "My git config";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;

      settings = {
        alias = {
          sur = "submodule update --recursive";
          pf = "push --force-with-lease";
        };

        column.ui = "auto";
        branch.sort = "-committerdate";
        tag.sort = "version:refname";
        init.defaultBranch = "master";
        diff = {
          algorithm = "histogram";
          colorMoved = "plain";
          mnemonicPrefix = true;
          renames = true;
        };
        push = {
          default = "simple";
          autoSetupRemote = true;
          followTags = true;
        };
        commit.verbose = true;
        merge.conflictStyle = "zdiff3";

      };
    };
  };
}
