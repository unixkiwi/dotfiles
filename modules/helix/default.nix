{ config, pkgs, ... }: 

{
  programs.helix = {
    enable = true;
    settings = {
      #theme = "everforest_dark";
    };
  };
}
