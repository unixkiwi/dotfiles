{ config, pkgs, ... }:

let
  aliases = {
    # Clear
    "c" = "clear";

    # Listing stuff
    "ls" = "eza -1 --icons=always";
    "ll" = "eza -lh --icons=always";
    "la" = "eza -lah --icons=always";
  };
in
{

  home.packages = with pkgs; [
    eza
  ];

  imports = [
    ./myZsh.nix
  ];

  home.shellAliases = aliases;

  #programs.bash = {
  #  enable = true;
  #  shellAliases = {
  #    ls = "exa -1 --icons=always";
  #    ll = "exa -lh --icons=always";
  #    la = "exa -lah --icons=always";
  #    c = "clear";
  #  };
  #};  
}
