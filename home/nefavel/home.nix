{ config, pkgs, ...}:

{

  imports = [
    ./packages.nix
    ../modules/default.nix
  ];

  vscode.enable = true;

  home.username = "nefavel";
  home.homeDirectory = "/home/nefavel";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
