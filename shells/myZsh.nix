{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    #autosuggestion.enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

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
