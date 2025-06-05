{
    # Bootloader.
    # To find more info check this out: https://nixos.wiki/wiki/Bootloader
    
    
    # EFI systems: 
    #boot.loader.systemd-boot.enable = true;
    #boot.loader.efi.canTouchEfiVariables = true;
    
    # BIOS systems:
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/vda";
}
