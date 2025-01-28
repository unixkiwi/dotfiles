{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # GRUB 2
  # boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/vda"; # or "nodev" for efi only

  # Systemd boot
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nixos"; # Define your hostname.

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Timezone
  time.timeZone = "Europe/Berlin";

  # locales
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "de-latin1";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ## X11 
  services.xserver.enable = true;
  #programs.xwayland.enable = true;

  services.xserver.windowManager.i3.enable = true;
  services.displayManager.defaultSession = "none+i3";

  # SDDM
  services.displayManager.sddm = {
    enable = true;
    #wayland.enable = true;
  };

  # KDE Plasma 6 DE
  services.desktopManager.plasma6.enable = true;
  # is needed bc of wayland
  #services.displayManager.defaultSession = "plasma";
  
  programs.dconf.enable = true;

  # X11 Keyboard Layout
  services.xserver.xkb.layout = "de";

  # Sound
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Touchpad support
  services.libinput.enable = true;

  # Default Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Stylix
  stylix = {
    enable = true;
    image = ./wallpapers/nixos_everforest.png; 
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
  };

  # User 'kiwi'
  users.users.kiwi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" ];
  };

  # Allow unfree(not open source) pkgs
  nixpkgs.config.allowUnfree = true;

  # System-wide Packages
  environment.systemPackages = with pkgs; [
    # System
    gcc
    glibc
    nixd
    wget
    curl
    zip
    unzip
    psmisc
    bluez
    bluez-tools
    libnotify
    xdg-utils
    xdg-desktop-portal
    pipewire
    fzf
    bat
    eza
    tree

    # Fonts
    fira-code
    #nerd-fonts.fira-code
    #nerd-fonts.caskaydia-mono

    # Desktop
    mc
    git
    networkmanager
    networkmanagerapplet
    btop
    neofetch # :)

    # Editor
    vim
    nano
    helix
    emacs
    neovim
    
    ## Programming Languages
    jdk
    python3Full
    
    # Rust
    cargo
    rustc
    rust-analyzer
  ];

  # Java
  programs.java.enable = true;

  # Virual machines
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "kiwi" ];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  ## Some services
  
  # SSH
  services.openssh.enable = true;

  # Disk/Mounting stuff
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Startup scripts
  system.userActivationScripts = {
    # remove all .hm-bkp home-manager backup files, to prevent conflicts
    removeConflictingBkpFiles = {
      text = ''
        find /home/kiwi/ -type f -name "*.hm-bkp" -delete
      '';
    };
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}

