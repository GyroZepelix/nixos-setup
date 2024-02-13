{pkgs, ...}:

{
  home.packages = with pkgs; [
    bat
    jless
    eza
  ];

  home.shellAliases = {
    ls = "exa --icons";
    cat = "bat";
    tree = "exa --icons --tree";
  };
}
