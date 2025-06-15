{ pkgs, lib, config, ... }:

{
  options = {
    printing-support.enable = 
      lib.mkEnableOption "enable printing services";
  };

  config = lib.mkIf config.printing-support.enable {
    services.printing.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    environment.systemPackages = with pkgs; [
      kdePackages.print-manager
    ];
  };
}