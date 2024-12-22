{ config, pkgs, ... }:

{

  imports = [
    ./shells/myShell.nix
  ];

  home.username = "kiwi";
  home.homeDirectory = "/home/kiwi";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    hello
    neofetch
    bat
    nerd-fonts.fira-code
  
    librewolf
    alacritty
    mc
    vscode
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kiwi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  #programs.zsh = {
  #  enable = true;
  #  shellAliases = {
  #    c= "clear";
  #    la = "eza -lah --icons=always";
  #    ls = "eza -1 --icons=always";
  #    ll = "eza -lh --icons=always";
  #  };
  #};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
