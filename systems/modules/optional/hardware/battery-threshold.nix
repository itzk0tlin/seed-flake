{ lib, config, ...}:

{
  options = {
    battery-threshold.enable = 
      lib.mkEnableOption "enable battery threshold";
  };
  config = lib.mkIf config.battery-threshold.enable {
    systemd.services.setBatteryChargeThreshold = {
      description = "Set the battery charge threshold";
      after = [ "multi-user.target" ];

      serviceConfig = {
        Type = "oneshot";
        Restart = "on-failure";
      };

      startLimitBurst = 0;

      script = ''
        echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold
        echo 70 > /sys/class/power_supply/BAT0/charge_control_start_threshold
      '';

      wantedBy = [ "multi-user.target" ];
    };
  };
}