{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    theme = {
      package = pkgs.everforest-gtk-theme;
      name = "Everforest-Dark";
    };
  };
}
