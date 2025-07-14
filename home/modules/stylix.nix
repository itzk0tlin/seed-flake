{ lib, config, pkgs, ... }:

{
  options = {
    stylix-preset.enable =
      lib.mkEnableOption "enable stylix preset";
  };

  config = lib.mkIf config.stylix-preset.enable {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

      cursor = {
        package = pkgs.oreo-cursors-plus;
        name = "oreo_white_cursors";
        size = 24;
      };

      opacity = {
        desktop = 0.0; #waybars opacity
        popups = 0.75;
        terminal = 0.9;
      };
    };
  };
  
}