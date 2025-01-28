{ config, lib, pkgs, ... }:

{
  imports = [
    ./shell
    ./browser
    ./helix
    ./terminal
    ./wm
  ];

  #./virt_man
}
