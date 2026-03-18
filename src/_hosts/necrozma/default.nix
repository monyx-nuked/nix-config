{lib, ...}: {
  boot = {
    loader.systemd-boot = {
      enable = false;
      memtest86.enable = false;
    };
    loader.efi.canTouchEfiVariables = false;
  };

  wsl = {
    enable = true;
    defaultUser = "monyx";
    startMenuLaunchers = true;
    useWindowsDriver = true;
    wslConf = {
      boot.systemd = true;
      interop = {
        enabled = true;
        appendWindowsPath = true;
      };
      network = {
        generateHosts = true;
        generateResolvConf = true;
      };
    };
  };

  networking.hostName = "necrozma";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "25.11";
}
