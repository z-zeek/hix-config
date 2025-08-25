{ config, pkgs, callPackage, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "stockholm";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8"];
  networking.networkmanager.wifi.macAddress = "random";
  networking.networkmanager.ethernet.macAddress = "random";
  services.dnscrypt-proxy2.enable = true;
}
