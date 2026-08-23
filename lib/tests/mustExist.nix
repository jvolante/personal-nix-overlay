let
  pkgs = import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-25.11.tar.gz") {};
  lib = import ../default.nix { inherit pkgs; };
in

lib.runTests {
  testMustExistCurrentDir = {
    expr = lib.mustExist ./.;
    expected = ./.;
  };

  testMustExistThisFile = {
    expr = lib.mustExist ./mustExist.nix;
    expected = ./mustExist.nix;
  };

  testMustExistFail = {
    expr = builtins.tryEval (lib.mustExist "/nonexistent-path-12345");
    expected = {
      success = false;
      value = false;
    };
  };

  testFileMustExistFile = {
    expr = lib.fileMustExist ./mustExist.nix;
    expected = ./mustExist.nix;
  };

  testFileMustExistDir = {
    expr = builtins.tryEval (lib.fileMustExist ./.);
    expected = {
      success = false;
      value = false;
    };
  };

  testFileMustExistFail = {
    expr = builtins.tryEval (lib.fileMustExist "/nonexistent-path-12345");
    expected = {
      success = false;
      value = false;
    };
  };

  testDirectoryMustExistDir = {
    expr = lib.directoryMustExist ./.;
    expected = ./.;
  };

  testDirectoryMustExistFile = {
    expr = builtins.tryEval (lib.directoryMustExist ./mustExist.nix);
    expected = {
      success = false;
      value = false;
    };
  };

  testDirectoryMustExistFail = {
    expr = builtins.tryEval (lib.directoryMustExist "/nonexistent-path-12345");
    expected = {
      success = false;
      value = false;
    };
  };
}
