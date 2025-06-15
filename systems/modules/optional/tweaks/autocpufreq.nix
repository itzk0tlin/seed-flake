{ lib, config, ... }:

{
  # Auto-cpufreq works poorly on workstation - itzkodee 10.06.25
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