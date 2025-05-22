{ config, pkgs, callPackage, ... }:

{
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
  
  xdg.mime.enable = true;

  # enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    #wrapperFeatures.gtk = true;
    #wrapperFeatures.base = true;
  };

  programs.waybar.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    alacritty
    pulseaudio
    pavucontrol
    wayland
    waybar
    wofi
    xdg-utils
    glib
    dracula-theme
    adwaita-icon-theme
    swaylock
    swayidle
    grim
    slurp
    wl-clipboard
    bemenu
    mako
    wdisplays
    vim
    wget
    tmux
    curl
    just
    ranger
    screen
    git
    python3
    distrobox
    xorg.xhost
    gnome-keyring
    conmon
    crun
    slirp4netns
    su
    skopeo
    buildah
    gnupg
    wireguard-tools
    cryfs
    nautilus
    playerctl
    brightnessctl
    pamixer
    swaybg
    kanshi
    foot
    wf-recorder
    light
    yad
    zathura
    glow
    wlogout
    mpv
    mdp
    mpc
    viewnior
    imagemagick
    pastel
    pywal
    rofi-wayland
    pulsemixer
    xdg-user-dirs
    xdg-desktop-portal-hyprland
    firefox
    _1password-gui
    _1password-cli
    podman
    dbus
    zsh
    networkmanager
    networkmanagerapplet
    libsForQt5.qt5ct 
    dhcpcd
    ags
    neovim
  ];

  fonts = {
    packages =  with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Source Han Serif" ];
      sansSerif = [ "Noto Sans" "Source Han Sans" ];
    };
  };
}
