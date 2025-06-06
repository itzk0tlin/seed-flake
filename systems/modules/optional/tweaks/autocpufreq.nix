{ lib, config, ... }:

{
  options = {
    autoCpuFreq.enable =
      lib.mkEnableOption "enable auto-cpufreq module";
  };

  config = lib.mkIf config.autoCpuFreq.enable {
    services.power-profiles-daemon.enable = false;

    services.auto-cpufreq.enable = true;
    services.auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "balanced";
        turbo = "never";
      };
    };
  };
  
}