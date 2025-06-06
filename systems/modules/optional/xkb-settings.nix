{lib, config, ...}:

{
    # Configure keymap in X11
    # It's not always working..
    # Because different desktop enviroments handles this setting.
    # So don't worry about this much.
    options = {
        xkbPreset.enable = 
            lib.mkEnableOption "enable default xkb preset";
    };
    config = lib.mkIf config.xkbPreset.enable {
        services.xserver.xkb = {
            layout = "us,ru";
            variant = "";
            options = "grp:win_space_toggle";
        };
    };
}
