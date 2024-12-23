{ config, lib, pkgs, ... }:

{
  programs.librewolf = {
    #enable = true;
    settings = {
      "general.autoScroll" = true;
    };
  };
}
