{pkgs, ...}:

{
  home.file.".p10k.zsh".source = ./dotfiles/p10k-config/.p10k.zsh;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /etc/nixos#default";
      nixtest = "sudo nixos-rebuild test --flake /etc/nixos#default"; 
    };

    initExtraBeforeCompInit = ''
      # Source the Powerlevel10k configuration file if it exists
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

      # Add shortcuts
      bindkey '^[[1;5D' backward-word
      bindkey '^[[1;5C' forward-word
      bindkey '^H' backward-kill-word
      bindkey '5~' kill-word
    '';
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
      ];
    };
  };
}
