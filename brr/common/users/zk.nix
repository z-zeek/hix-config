{ config, pkgs, callPackage, ... }:

{
  users.users.zk = {
    isNormalUser = true;
    description = "Nutella";
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "podman"];
    #openssh.authorizedKeys.keys = [
    #  "ssh_key"
    #];
    packages = with pkgs; [
      firefox
      neovim
    ];
    linger = true;
  };

  security.sudo.extraRules = [
    {
      groups = [ "devops" ];
      commands = [ { command = "ALL"; options = [ "NOPASSWD" ]; } ];
    }
  ];
    users.groups.devops.gid = 5000;
}