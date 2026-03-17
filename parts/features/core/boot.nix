{...}: {
  flake.modules.nixos.boot = {...}: {
    boot = {
      loader.systemd-boot = {
        enable = true;
        memtest86.enable = true;
      };
      loader.efi.canTouchEfiVariables = true;
      consoleLogLevel = 0;
      initrd.systemd.enable = true;
    };
  };
}
