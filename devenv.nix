{ pkgs, ... }:

{
  packages = with pkgs; [ stylua nixpkgs-fmt lua-language-server ];
}
