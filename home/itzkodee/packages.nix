{lib, pkgs, ...}:

{

  home.packages = with pkgs; [
    librewolf
    qbittorrent
    bottles
    libreoffice
    gimp
    obsidian
  ];
  
}
