{ config, pkgs, ...}:

{

  imports = [
    ./packages.nix
    ./modules/bundle.nix
  ];

  home.username = "nefavel";
  home.homeDirectory = "/home/nefavel";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
