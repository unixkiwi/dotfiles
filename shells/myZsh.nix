{ config, lib, pkgs, ... }:

{ 
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
    };

    plugins = [
      {
        name = "zsh-autocomplete";
        src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "762afacbf227ecd173e899d10a28a478b4c84a3f";
          sha256 = "1357hygrjwj5vd4cjdvxzrx967f1d2dbqm2rskbz5z1q6jri1hm3";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      extraConfig = ''
                setopt autocd
                setopt globdots
      '';
    };

    initExtra = ''
      bindkey -M menuselect '^[[B' .accept-line
    '';
  };
}
