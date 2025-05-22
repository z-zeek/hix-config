# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, inputs, lib, pkgs, ... }: 


let
  segoeFont = pkgs.stdenv.mkDerivation {
    pname = "segoe-ui-font";
    version = "master";

    src = pkgs.fetchurl {
      url = "https://github.com/mrbvrz/segoe-ui-linux/archive/refs/heads/master.zip";
      sha256 = "WQFVhZqSg5XD1HhAiM7eUjOAUJCjB5YfjrIAUUFHf2M=";
    };

    # Add coreutils to ensure 'unzip' is available during the build process
    buildInputs = [ pkgs.unzip ];

    # Explicitly set the unpack phase to unzip the downloaded ZIP file
    unpackPhase = ''
      # Ensure 'unzip' is available from coreutils and unzip the source
      mkdir -p $out/share/fonts/truetype/segoe
      unzip $src -d $out/share/fonts/truetype/segoe
    '';

    installPhase = "true";  # No actual install phase needed since unzip happens in unpackPhase
  };
in

{

  nixpkgs.config.allowUnfree = true;

  hardware.firmware = let
    brcmFirmware = pkgs.runCommand "brcm-firmware" {
      src = ./lib/firmware/brcm;
    }  ''
       mkdir -p $out/lib/firmware/brcm
       cp -r $src/* $out/lib/firmware/brcm/
    '';
  
  in [ brcmFirmware ];

  # add env packages
  environment.systemPackages = with pkgs; [
    nwg-look
    hyprland
    wayland
    wayland-utils
    waybar
    kitty
    fish
    wofi
    rofi
    brightnessctl
    grim
    slurp
    wl-clipboard
    xdg-desktop-portal-hyprland
    networkmanager
    networkmanagerapplet
    iw
    curl
    wget
    nixpkgs-fmt
    nixfmt
    dhcpcd
    wpa_supplicant
    vim
    git
    xdg-utils
    dbus
    pam
    firefox
    ags
    anyrun
    zsh
    foot
    fuzzel
    libsForQt5.qt5ct
    wlogout
    zsh
    _1password-gui
    _1password-cli
    vscode
    distrobox
    podman
  ];
  
  # enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  # enable greetd
  services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
          user = "zk";
      };
    };
  };

  services.xserver.enable = false;
  services.dbus.enable = true;

  hardware.opengl.enable = true;


  # Portal support
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    xdgOpenUsePortal = true;
  };

  # enable pipewire (audio)
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = false;
  };
  
  users.users.zk = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
    packages = with pkgs; [
      firefox
      neovim
    ];
  };
 
  # Enable networking and fonts
  networking.hostName = "stockholm";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "1.1.1.1" "8.8.8.8"];
    

  fonts.packages = with pkgs; [ noto-fonts noto-fonts-emoji segoeFont ];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader= {
    efi.efiSysMountPoint = "/mnt/boot";
    systemd-boot.enable = true;
  };
 
  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "25.05";

}
