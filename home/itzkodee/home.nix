{ config, pkgs, ...}:

{

  imports = [
    ./packages.nix
    ./git
    ../modules/default.nix
  ];

  vscode.enable = true;
  stylix-preset.enable = true;

  home.username = "itzkodee";
  home.homeDirectory = "/home/itzkodee";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
