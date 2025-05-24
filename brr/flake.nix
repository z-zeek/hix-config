{
  nixConfig = {
    extra-substituters = [
      "https://cache.soopy.moe"
    ];
    extra-trusted-public-keys = [ "cache.soopy.moe-1:0RZVsQeR+GOh0VQI9rvnHz55nVXkFardDqfm4+afjPo=" ];
  };


  description = "Trallelo Trallala's personal computational machine";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    flake-parts.url = "github:hercules-ci/flake-parts";
    gross.url = "github:fufexan/gross";
    matugen.url = "github:/InioX/Matugen";
    more-waita.url = "github:somepaulo/MoreWaita";
    firefox-gnome-theme.url = "github:rafaelmardojai/firefox-gnome-theme";
    anyrun.url = "github:Kirottu/anyrun";
    };

  outputs =  { nixpkgs, nixos-hardware, ... }:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;

      nixosConfigurations.stockholm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./common/hardware/brcm.nix
          ./common/hardware/touchpad.nix
          ./common/DE/hyprland.nix
          ./common/DE/greetd.nix
          ./common/system/garbagecollect.nix
          ./common/system/journald.nix
          ./common/system/locales.nix
          ./common/system/docker.nix
          ./common/system/podman.nix
          ./common/system/pipewire.nix
          ./common/system/systemd-boot.nix
          ./common/system/zram.nix
          ./common/system/rtkit.nix
          ./common/system/nix_cfg.nix
          ./common/system/autoupgrade.nix
          ./common/networking/ssh.nix
          ./common/networking/network_manager.nix
          ./common/networking/fw_off.nix
          ./common/users/zk.nix
          ./hardware-configuration.nix
          ./configuration.nix
          ./nix/substituter.nix
          nixos-hardware.nixosModules.apple-t2
        ];
      };
    };
}
