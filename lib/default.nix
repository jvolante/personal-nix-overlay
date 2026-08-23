{
  lib,
}:
{
  # Check if a path exists, return path if it does, otherwise throw.
  # This is useful for service definitions, where the service runs an executable
  # like ${pkgs.nginx}/bin/nginx. You can wrap this like `lib.mustExist ${pkgs.nginx}/bin/nginx`
  # this way the service definition will fail to build if that executable doesn't exist.
  mustExist =
    path:
    if builtins.pathExists path then
      path
    else
      throw "Path does not exist: ${path}";

  # Check if a path exists and is a regular file, otherwise throw.
  fileMustExist =
    path:
    if builtins.pathExists path && lib.filesystem.pathIsRegularFile path then
      path
    else if !builtins.pathExists path then
      throw "File does not exist: ${path}"
    else
      throw "Not a regular file: ${path}";

  # Check if a path exists and is a directory, otherwise throw.
  directoryMustExist =
    path:
    if builtins.pathExists path && lib.filesystem.pathIsDirectory path then
      path
    else if !builtins.pathExists path then
      throw "Directory does not exist: ${path}"
    else
      throw "Not a directory: ${path}";
}
