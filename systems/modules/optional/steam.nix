{lib, config, pkgs, ...}:

{

  options = {
    steam.enable =
      lib.mkEnableOption "enable steam and gaming dependecies";
  };

  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      package = pkgs.steam-small.override {
        extraEnv = {
            OBS_VKCAPTURE = true;
        };
      };
    };
  };

}