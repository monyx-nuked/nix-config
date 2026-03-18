{...}: {
  flake.modules.nixos.fstrim = {
    lib,
    config,
    ...
  }:
    lib.mkIf config.host.hasScreen {
      services.fstrim.enable = true;
    };
}
