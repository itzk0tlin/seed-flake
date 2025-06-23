{lib, pkgs, ...}:

{

  home.packages = with pkgs; [
    librewolf
    qbittorrent
    bottles
    libreoffice
    gimp
    obsidian
    prismlauncher
    telegram-desktop
    blender
  ];
  
}
