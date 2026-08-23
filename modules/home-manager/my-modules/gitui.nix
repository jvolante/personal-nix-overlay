{ lib, config, pkgs, ... }:
  with lib;
let
  cfg = config.programs.my-modules.gitui;
in
{
  options.programs.my-modules.gitui = {
    enable = mkEnableOption "My gitui config";
  };

  config = mkIf cfg.enable {
    programs.gitui = {
      enable = true;
      keyConfig = ''
        (
              move_left: Some(( code: Char('h'), modifiers: (bits: 0,),)),
              move_right: Some(( code: Char('l'), modifiers: (bits: 0,),)),
              move_up: Some(( code: Char('k'), modifiers: (bits: 0,),)),
              move_down: Some(( code: Char('j'), modifiers: (bits: 0,),)),
            )'';
      theme = ''
        (
              selected_tab: Reset,
              command_fg: White,
              selection_bg: Blue,
              selection_fg: White,
              cmdbar_bg: Rgb(39, 46, 51),
              cmdbar_extra_lines_bg: Rgb(39, 46, 51),
              disabled_fg: DarkGray,
              diff_line_add: LightGreen,
              diff_line_delete: LightRed,
              diff_file_added: LightGreen,
              diff_file_removed: LightRed,
              diff_file_moved: LightMagenta,
              diff_file_modified: LightYellow,
              commit_hash: LightMagenta,
              commit_time: LightCyan,
              commit_author: LightGreen,
              danger_fg: LightRed,
              push_gauge_bg: Blue,
              push_gauge_fg: Reset,
              tag_fg: LightMagenta,
              branch_fg: LightYellow,
            )'';
    };
  };
}
