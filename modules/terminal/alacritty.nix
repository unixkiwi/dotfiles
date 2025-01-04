{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      cursor.style = {
        shape = "Beam";
        blinking = "On";
      };
      cursor.blink_interval = 500;
      cursor.thickness = 0.2;
    };
  };
}
