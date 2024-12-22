{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-autocomplete
  ];
  
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    historySubstringSearch = {
      enable = true;
      searchUpKey = ["\\eOA"];
      searchDownKey = ["\\eOB"];
    };

    interactiveShellinit = ''
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    '';

    #oh-my-zsh = {
    #  enable = true;
    #  plugins = [
    #    "git"
    #    "zsh-autosuggestions"
    #    "zsh-syntax-highlighting"
    #    "fast-syntax-highlighting"
    #    "zsh-autocomplete"
    #  ];
    #};
  };
}
