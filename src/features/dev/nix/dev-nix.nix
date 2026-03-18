_: {
  flake.modules.nixos.dev-nix = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      alejandra
      nil
      nixd
      nix-melt
      nix-tree
      nix-init
      nurl
      deadnix
      manix
      statix
    ];
  };
}
