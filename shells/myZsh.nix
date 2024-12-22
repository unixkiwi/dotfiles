{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
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

    initExtra = ''
      setopt NO_CASE_GLOB
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=*      r:|=*' 'l:|=* r:|=*'
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
