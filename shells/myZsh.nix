{ config, lib, pkgs, ... }:

let
  p10kPath = ./.p10k.zsh;
in
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
      {                                                                                   
        name = "powerlevel10k";                                                           
        src = pkgs.zsh-powerlevel10k;                                                     
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";                         
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      extraConfig = ''
                setopt autocd
                setopt globdots
      '';
    };

    home.file.".p10k.zsh" = {
        source = ${p10kPath};
        target = ".p10k.zsh";
    };

    initExtraFirst = ''
      source ~/.p10k.zsh
    '';

    initExtra = ''
      bindkey -M menuselect '^[[B' .accept-line
    '';
  };
}
