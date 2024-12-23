{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/vda"; # or "nodev" for efi only
  
  networking.hostName = "nixos"; # Define your hostname.

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "de-latin1";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ## X11 
  services.xserver.enable = true;

  # SDDM
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true
  };

  # KDE Plasma 6 DE
  services.desktopManager.plasma6.enable = true;
  # is needed bc of wayland
  services.displayManager.defaultSession = "plasma";
  
  programs.dconf.enable = true;

  # X11 Keyboard Layout
  services.xserver.xkb.layout = "de";

    # Enable sound.
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
    nerd-fonts.fira-code

    # Desktop
    mc
    git
    networkmanager
    networkmanagerapplet
    btop
    neofetch # :)

    # Gtk
    gtk2
    gtk3
    gtk4

    # Qt
    qt5.full
    qt6.full    

    # Editor
    vim
    nano
    helix
  ];

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
  services.devom.enable = true;
  service.gvfs.enable = true;
  services.udisks2.enable = true;

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}

