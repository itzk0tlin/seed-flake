{lib, config, ...}:

{
    # Bootloader.
    # To find more info check this out: https://nixos.wiki/wiki/Bootloader
    options = {
        uefiLoader.enable =
            lib.mkEnableOption "enable bootloader uefi mode";
        biosBoot.enable =
            lib.mkEnableOption "enable bootloader bios mode";
    };
    
    config = lib.mkMerge [ 
        (lib.mkIf (config.uefiLoader.enable) {
            # EFI systems: 
            boot.loader.systemd-boot.enable = true;
            boot.loader.efi.canTouchEfiVariables = true;
        })
        (lib.mkIf (config.biosBoot.enable) {
            #BIOS systems:
            boot.loader.grub.enable = true;
            boot.loader.grub.device = "/dev/vda";
        })
    ];
}
