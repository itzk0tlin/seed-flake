{
    # What is this file?
    # This is my way to manage big amounts of nix files that serve one purpose.
    # There's a lot of ways to do it, but I use this because it's IMHO easier.
    # Check this out https://nixos.wiki/wiki/NixOS_modules#Imports 
    imports = [
        ./minimal/bootloader.nix
        ./minimal/locales.nix
        ./minimal/garbage-collector.nix

        ./optional/fonts.nix
        ./optional/xkb-settings.nix
        ./optional/zapret.nix
        ./optional/steam.nix
        ./optional/flatpak.nix
        ./optional/printing-support.nix
        ./optional/privacy-contribuitor.nix

        ./optional/desktop-enviroments/cinnamon.nix

        ./optional/tweaks/autocpufreq.nix
        ./optional/tweaks/gaming-tweaks.nix

        ./optional/hardware/battery-threshold.nix
    ];
}