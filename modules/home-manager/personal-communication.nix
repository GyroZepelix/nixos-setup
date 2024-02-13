{ inputs, lib, config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    whatsapp-for-linux
  ];
}
