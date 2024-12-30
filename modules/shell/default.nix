{ config, pkgs, ... }:

let
  aliases = {
    # Clear
    "c" = "clear";

    # Cat alternative
    "cat" = "bat";

    # Listing stuff
    "ls" = "eza -1 --icons=always";
    "ll" = "eza -lh --icons=always";
    "la" = "eza -lah --icons=always";
  };
in
{

  home.packages = with pkgs; [
    eza
    zsh
  ];

  imports = [
    ./myZsh.nix
  ];

  home.shellAliases = aliases;
}
