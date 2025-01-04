{ config, lib, pkgs, ... }:

{
  imports = [
    ./gtk
    ./shell
    ./browser
    ./virt_man
    ./helix
  ];
}
