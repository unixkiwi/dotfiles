{ config, pkgs, ... }:

{

  imports = [
    ./myZsh.nix
  ];

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
