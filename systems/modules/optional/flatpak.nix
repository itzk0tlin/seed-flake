{ lib, config, pkgs, ...}:

{
  options = {
    flatpak-preset.enable =
      lib.mkEnableOption "enable flatpak preset";
  };

  config = lib.mkIf config.flatpak-preset.enable {
    services.flatpak.enable = true;
    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        flatpak install flathub io.github.flattool.Warehouse
      '';
    };
  };
}