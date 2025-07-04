# Help is available in the configuration.nix man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  imports = [ 
    ../modules/default.nix # minimal bundle to run pc
    ./default.nix
  ];

  zapretPreset.enable = true;
  printing-support.enable = true;

  gaming-tweaks.enable = true;
  steam.enable = true;
  flatpak-preset.enable = true;

  #autoCpuFreq.enable = true;
  uefiBoot.enable = true;
  battery-threshold.enable = true;

  cinnamon.enable = true;
  xkbPreset.enable = true;

  privacy-contribuitor.enable = true;
  zramSwap.enable = true;
  services.gvfs.enable = true;  # This lines are for USB sticks if you need to mount one.
  services.udisks2.enable = true;

  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
  
  networking.firewall.allowedTCPPorts = [
    25565
  ];

  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;

  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "41d49af6c287fe2b"
    ];
  };

  # Even tho flakes is experimental feature it's rock solid and you should use it.
  # https://wiki.nixos.org/wiki/Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Moscow"; # Change according to your time-zone

  system.stateVersion = "25.05"; # Change it according to /etc/nixos/configuration.nix. 
  # Why? Check this out: https://wiki.nixos.org/wiki/FAQ/When_do_I_update_stateVersion

  networking.firewall = {
    enable = true;
  };
}
