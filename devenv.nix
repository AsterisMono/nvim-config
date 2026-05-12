{ pkgs, ... }:

{
  languages = {
    lua.enable = true;
    nix.enable = true;
  };

  packages = with pkgs; [
    nixfmt
    stylua
  ];
}
