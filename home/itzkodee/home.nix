{ config, pkgs, ...}:

{

  imports = [
    ./packages.nix
    ./git.nix
    ../modules/default.nix
  ];

  vscode.enable = true;
  stylix-preset.enable = true;

  home.username = "itzkodee";
  home.homeDirectory = "/home/itzkodee";

  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
