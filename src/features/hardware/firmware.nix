{...}: {
  flake.modules.nixos.firmware = {
    config,
    lib,
    ...
  }:
    lib.mkIf config.host.hasScreen {
      services.fwupd.enable = true;
    };
}
