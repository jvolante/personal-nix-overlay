{
  lib,
  config,
  pkgs,
  ...
}:
  with lib;
let
  cfg = config.programs.my-modules.starship;
in
{
  options.programs.my-modules.starship = {
    enable = mkEnableOption "My starship config";
  };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        add_newline = false;
        line_break = {
          disabled = true;
        };
        nix_shell = {
          symbol = " ";
        };
        battery = {
          disabled = true;
        };
        c = {
          disabled = true;
        };
        cmake = {
          disabled = true;
        };
        cmd_duration = {
          disabled = true;
        };
        cobol = {
          disabled = true;
        };
        crystal = {
          disabled = true;
        };
        daml = {
          disabled = true;
        };
        deno = {
          disabled = true;
        };
        docker_context = {
          symbol = " ";
        };
        dotnet = {
          disabled = true;
        };
        elixir = {
          disabled = true;
        };
        elm = {
          disabled = true;
        };
        erlang = {
          disabled = true;
        };
        # fennel = {
        #   disabled = true;
        # };
        # go = {
        #   disabled = true;
        # };
        haskell = {
          disabled = true;
        };
        haxe = {
          disabled = true;
        };
        helm = {
          disabled = true;
        };
        java = {
          disabled = true;
        };
        julia = {
          disabled = true;
        };
        kotlin = {
          disabled = true;
        };
        lua = {
          disabled = true;
        };
        nim = {
          disabled = true;
        };
        nodejs = {
          disabled = true;
        };
        ocaml = {
          disabled = true;
        };
        perl = {
          disabled = true;
        };
        php = {
          disabled = true;
        };
        pijul_channel = {
          disabled = false;
        };
        purescript = {
          disabled = true;
        };
        rlang = {
          disabled = true;
        };
        raku = {
          disabled = true;
        };
        red = {
          disabled = true;
        };
        ruby = {
          disabled = true;
        };
        rust = {
          disabled = true;
        };
        scala = {
          disabled = true;
        };
        status = {
          disabled = false;
        };
        swift = {
          disabled = true;
        };
        vagrant = {
          disabled = true;
        };
        vlang = {
          disabled = true;
        };
        zig = {
          disabled = true;
        };
      };
    };
  };
}
