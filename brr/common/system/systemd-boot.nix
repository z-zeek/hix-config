{ config, pkgs, callPackage, ... }:

{
    # Use the systemd-boot EFI boot loader.
  boot.loader= {
    efi.efiSysMountPoint = "/mnt/boot";
    systemd-boot.enable = true;
  };
}
