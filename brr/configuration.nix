# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, inputs, lib, pkgs, ... }: 

{
  services.xserver.enable = false;
  services.dbus.enable = true;

  system.stateVersion = "25.05";

}