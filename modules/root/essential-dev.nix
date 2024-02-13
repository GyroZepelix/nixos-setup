{ inputs, lib, config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    
  };

  environment.systemPackages = with pkgs; [
    git
    vscode
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
