{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
        "fast-syntax-highlighting"
        "zsh-autocomplete"
      ];
    };
  };
}
