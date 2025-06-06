# Help is available in the configuration.nix man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  imports = [ 
    ../modules/default.nix # minimal bundle to run pc
    ./default.nix
  ];

  biosBoot.enable = true;
  cinnamon.enable = true;
  xkbPreset.enable = true;

  # Even tho flakes is experimental feature it's rock solid and you should use it.
  # https://wiki.nixos.org/wiki/Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Moscow"; # Change according to your time-zone

  system.stateVersion = "24.05"; # Don't touch it. 
  # Why? Check this out: https://wiki.nixos.org/wiki/FAQ/When_do_I_update_stateVersion


  # services.gvfs.enable = true;  # This lines are for USB sticks if you need to mount one.
  # services.udisks2.enable = true;

}
