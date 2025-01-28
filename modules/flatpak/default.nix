{ config, pkgs, ... }:

let
  flats = [
    "net.sf.VICE"
  ];
in
{
  system.activationScripts.flatpakManagement = {
    text = ''
      ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

      installedFlats=$(${pkgs.flatpak}/bin/flatpak list --app --columns=application)
      
      for installed in $installedFlats; do
        if ! echo ${toString flats} | ${pkgs.gnugrep}/bin/grep -q $installed; then
          echo "Removing $installed bc it's not in the wanted flats"
          ${pkgs.flatpak}/bin/flatpak uninstall -y --noninteractive $installed
        fi
      done

      for app in ${toString flats}; do
        echo "Installing flat $app"
        ${pkgs.flatpak}/bin/flatpak install -y flathub $app
      done

      ${pkgs.flatpak}/bin/flatpak update -y
    '';
  };
}
