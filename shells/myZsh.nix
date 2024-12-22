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

    plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        { name =  "ohmyzsh/ohmyzsh oh-my-zsh"; }
        { name =  "ajeetdsouza/zoxide"; }
        { name =  "marlonrichert/zsh-autocomplete"; }
        { name =  "marlonrichert/zsh-edit"; }
        { name =  "zsh-users/zsh-autosuggestions"; }
        { name =  "ptavares/zsh-exa"; }
        { name =  "zsh-users/zsh-syntax-highlighting"; }
        { name =  "mbenford/zsh-tmux-auto-title"; }
        { name =  "zsh-users/zsh-history-substring-search"; }
    ];

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
