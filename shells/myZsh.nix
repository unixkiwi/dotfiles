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

      customThemes = {
        powerlevel10k = {
          name = "powerlevel10k";
          src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
          file = "powerlevel10k.zsh-theme";
        };
      };
      theme = "powerlevel10k";
    };

    initExtra = ''
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  '';

  };
}
