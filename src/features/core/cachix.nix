{...}: {
  flake.modules.nixos.cachix = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      cachix
    ];
  };
}
