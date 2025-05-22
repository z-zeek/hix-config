{ config, pkgs, callPackage, ... }:

{
  # enable pipewire (audio)
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = false;
  };
}
