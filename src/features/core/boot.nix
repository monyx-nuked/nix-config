_: {
  flake.modules.nixos.boot =
    { lib, ... }:
    {
      boot = {
        loader.systemd-boot = {
          enable = lib.mkDefault true;
          memtest86.enable = lib.mkDefault true;
        };
        loader.efi.canTouchEfiVariables = lib.mkDefault true;
        consoleLogLevel = 7;
        initrd.systemd.enable = true;
      };
    };
}
