{ lib, cvonfig, pkgs, ... }:

let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";
  
    userName = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
     };
   };

  config = lib.mkIf cfg.enable {
    users.users."${cfg.userName}" = {
      isNormalUser = true;
      shell = pkgs.zsh;
    };
  };
}
