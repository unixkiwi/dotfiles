{ config, pkgs, ... }:

{

  imports = [
    ./modules
  ];

  home.username = "kiwi";
  home.homeDirectory = "/home/kiwi";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Allow fc to find fonts from home-manager
  fonts.fontconfig.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };

  home.packages = with pkgs; [
    # Browser  
    # disabled bc of programs.librewolf.enable
    # in modules/browser/librewolf.nix conflicts with pkgs
    #librewolf

    # Utils
    gparted
    
    # Terminals
    alacritty
    kitty

    # Filemanager
    mc
    doublecmd

    # Fonts
    nerd-fonts.caskaydia-cove
    nerd-fonts.fira-code    

    # Editors
    vscode
    jetbrains.idea-community-bin
    jetbrains.pycharm-community-bin
    #android-studio-full
    kdePackages.kate

    # Minecraft
    prismlauncher
    # broken! minecraft

    # Notes
    obsidian

    # LibreOffic
    libreoffice

    # Photo stuff
    darktable
    gimp
    kdePackages.gwenview

    # Video Stuff
    vlc
    ffmpeg

    # Mouse
    piper

    # Recording
    obs-studio

    # Signal
    signal-desktop
        
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
