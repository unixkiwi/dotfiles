{ config, lib, pkgs, ... }:

{ 
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

    plugins = [
      {
        name = "zsh-autocomplete"; # completes history, commands, etc.
        src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "762afacbf227ecd173e899d10a28a478b4c84a3f";
          sha256 = "1357hygrjwj5vd4cjdvxzrx967f1d2dbqm2rskbz5z1q6jri1hm3";
        }; # e.g., nix-prefetch-url --unpack https://github.com/marlonrichert/zsh-autocomplete/archive/762afacbf227ecd173e899d10a28a478b4c84a3f.tar.gz
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "z" ];
      extraConfig = ''
                # Required for autocomplete with box: https://unix.stackexchange.com/a/778868
                zstyle ':completion:*' # completer _expand _complete _ignored _approximate _expand_alias
                # zstyle ':autocomplete:*' default-context curcontext 
                # zstyle ':autocomplete:*' min-input 0

                setopt HIST_FIND_NO_DUPS

                autoload -Uz compinit
                compinit

                setopt autocd
                setopt globdots
      '';
    };

        

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
