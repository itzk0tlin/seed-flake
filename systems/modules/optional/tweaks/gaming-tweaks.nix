{ lib, config, pkgs, ... }:

{
  options = {
    gaming-tweaks.enable =
      lib.mkEnableOption "apply tweaks for smoother gaming experience";
  };

  config = lib.mkIf config.gaming-tweaks.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    environment.systemPackages = with pkgs; [
      dxvk
      mesa
      mangohud
      gamemode
      gamescope
      vulkan-loader
      vulkan-validation-layers
    ];
  };
  
}