{ pkgs, lib, config, ... }:
{
  options = {
    vscode.enable =
      lib.mkEnableOption "enables vscode";
  };

  config = lib.mkIf config.vscode.enable {
    programs.vscode = 
    {
      enable = true;
      package = pkgs.vscodium-fhs;
      userSettings = 
      {
        "terminal.integrated.defaultProfile.linux" = "null";
        "terminal.integrated.shell.linux" = "/run/current-system/sw/bin/bash";
        "files.autoSave" = "on";
        "editor.minimap.enabled" = false;
        "editor.rulers" = [
          {
            "column" = 80;
            "color" = "#ff9900";
          }
        ];
      };
    };
  };

  
}