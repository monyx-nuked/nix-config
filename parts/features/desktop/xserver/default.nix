{...}: {
  flake.modules.nixos.xserver = {pkgs, ...}: {
    services.xserver = {
      enable = true;
      excludePackages = with pkgs; [xterm];
    };
  };
}
