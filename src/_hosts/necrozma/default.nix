{lib, ...}: {
  wsl = {
    enable = true;
    defaultUser = "monyx";
    startMenuLaunchers = true;
    useWindowsDriver = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "25.11";
}
