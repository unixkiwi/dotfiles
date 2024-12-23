{ config, lib, pkgs, ... }:

{
  dconf.settings = {
    "org/virt-mananger/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
