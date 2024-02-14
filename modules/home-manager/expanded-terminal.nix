{pkgs, ...}:

{
  home.packages = with pkgs; [
    jless
    fzf
  ];

  programs.bat = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    enableAliases = true;
    icons = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  home.shellAliases = {
    cat = "bat";
    tree = "exa --icons --tree";
  };
}
