{ config, pkgs, lib, ... }:

{
  home.username = "zk";
  home.homeDirectory = "/home/zk";
  home.stateVersion = "25.05";
  
  home.packages = [
    pkgs.hello
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };