{ lib, config, ...}:
{
  options = {
    privacy-contribuitor.enable = 
      lib.mkEnableOption "enable i2pd + snowflake proxies";
  };
  config = lib.mkIf config.privacy-contribuitor.enable {
    containers.snowflake = {
      autoStart = true;
      ephemeral = true;
      system.stateVersion = "25.05";
      config = {
        systemd.services.snowflake = {
          wantedBy = [ "multi-user.target" ];
          serviceConfig = {
            IPAccounting = "yes";
            ExecStart = "${pkgs.snowflake}/bin/proxy";
            DynamicUser = "yes";
            # Read-only filesystem
            ProtectSystem = "strict";
            PrivateDevices = "yes";
            ProtectKernelTunables = "yes";
            ProtectControlGroups = "yes";
            ProtectHome = "yes";
            # Deny access to as many things as possible
            NoNewPrivileges = "yes";
            PrivateUsers = "yes";
            LockPersonality = "yes";
            MemoryDenyWriteExecute = "yes";
            ProtectClock = "yes";
            ProtectHostname = "yes";
            ProtectKernelLogs = "yes";
            ProtectKernelModules = "yes";
            RestrictAddressFamilies = "AF_INET AF_INET6";
            RestrictNamespaces = "yes";
            RestrictRealtime = "yes";
            RestrictSUIDSGID = "yes";
            SystemCallArchitectures = "native";
            SystemCallFilter = "~@chown @clock @cpu-emulation @debug @module @mount @obsolete @raw-io @reboot @setuid @swap @privileged @resources";
            CapabilityBoundingSet = "";
            ProtectProc = "invisible";
            ProcSubset = "pid";
          };
        };
      };
    };
    containers.i2pd = {
      autoStart = true;
      system.stateVersion = "25.05";
      networking.firewall.allowedTCPPorts = [
        7070 # default web interface port
        4447 # default socks proxy port
        4444 # default http proxy port
      ];
      services.i2pd = {
        enable = true;
        address = "127.0.0.1";
        upnp.enable = true;
        proto = {
          http.enable = true;
          socksProxy.enable = true;
          httpProxy.enable = true;
        };
      };
    };
  };
  
}