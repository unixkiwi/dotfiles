{ config, lib, pkgs, ... }:

{
  imports = [
    ./shell
    ./browser
    ./virt_man
    ./helix
    ./terminal
    ./wm
  ];
}
