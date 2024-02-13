{ config, pkgs, ... }:

let
  hmModules = ../../modules/home-manager;
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  imports = [
    "${hmModules}/personal-communication.nix"
    "${hmModules}/essential-browsers.nix"
    "${hmModules}/zsh.nix"
    "${hmModules}/expanded-terminal.nix"
    "${hmModules}/work.nix"
    "${hmModules}/neovim.nix"
    "${hmModules}/git.nix"
    "${hmModules}/books.nix"
  ];

  home.username = "dgjalic";
  home.homeDirectory = "/home/dgjalic";
  
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.shellAliases = {
    update = "sudo nixos-rebuild switch --flake ~/nixos#default";
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = [];

  home.file = {};

  home.sessionVariables = {};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
