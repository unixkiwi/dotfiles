{ config, pkgs, ... }: 

{
  programs.helix.settings = {
    theme = "everforest_dark";
    editor.line-number = "relative";
  };
}
