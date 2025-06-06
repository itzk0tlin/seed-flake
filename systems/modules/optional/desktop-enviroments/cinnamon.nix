{lib, config, ...}:

{
  options = {
    cinnamon.enable =
      lib.mkEnableOption "enables Cinnamon DE";
  };
  
  config = lib.mkIf config.cinnamon.enable {
    services = {
      libinput.enable = true;
      displayManager.defaultSession = "cinnamon";
    };

    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.cinnamon.enable = true;
    };
  };
}
