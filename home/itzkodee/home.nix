{ config, pkgs, ...}:

{

  imports = [
    ./packages.nix
    ./git.nix
    ../modules/default.nix
  ];
  services.syncthing.enable = true;

  vscode.enable = true;
  stylix-preset.enable = true;

  home.username = "itzkodee";
  home.homeDirectory = "/home/itzkodee";

  home.stateVersion = "25.05";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
