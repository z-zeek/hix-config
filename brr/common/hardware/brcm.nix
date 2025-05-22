{ config, pkgs, callPackage, ... }:

{
  hardware.firmware = let
    brcmFirmware = pkgs.runCommand "brcm-firmware" {
      src = ./lib/firmware/brcm;
    }  ''
       mkdir -p $out/lib/firmware/brcm
       cp -r $src/* $out/lib/firmware/brcm/
    '';
  
  in [ brcmFirmware ];

  hardware.opengl.enable = true;
}
