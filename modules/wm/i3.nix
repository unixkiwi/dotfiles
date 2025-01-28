{ config, pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
    config = {
      modifier = "Mod4";
      focus.followMouse = true;

      keybindings = let modifier = config.xsession.windowManager.i3.config.modifier; in lib.mkOptionDefault {
        "${modifier}+Return" = "exec alacritty";
        "${modifier}+q" = "kill";
        "${modifier}+v" = "floating toggle";
      };
      
      defaultWorkspace = "workspace number 1";

      startup = [
        { command = "xrandr --output Virtual-1 --mode 1920x1080"; always = true; }
      ];

      workspaceLayout = "tabbed";
    };
  };
}
