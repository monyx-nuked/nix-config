{...}: {
  flake.modules.nixos.just = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      just
      just-lsp
    ];
  };
}
