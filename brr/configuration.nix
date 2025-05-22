# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, inputs, lib, pkgs, ... }: 

{
  services.xserver.enable = false;
  services.dbus.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  imports =
    [
      ../common/hardware/brcm.nix
      ../common/hardware/touchpad.nix
      ../common/DE/hyprland.nix
      ../commond/DE/greetd.nix
      ../common/system/garbagecollect.nix
      ../common/system/journald.nix
      ../common/system/locales.nix
      ../common/system/btrfs.nix
      ../common/system/docker.nix
      ../common/system/podman.nix
      ../common/system/pipewire.nix
      ../common/system/systemd-boot.nix
      ../common/system/zram.nix
      ../common/system/rtkit.nix
      ../common/system/nix_cfg.nix
      ../common/system/autoupgrade.nix
      ../common/networking/ssh.nix
      ../common/networking/network_manager.nix
      ../common/networking/fw_off.nix
      ../common/users/zk.nix
      ./hardware-configuration.nix
    ];

  system.stateVersion = "25.05";

}