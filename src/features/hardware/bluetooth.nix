{...}: {
  flake.modules.nixos.bluetooth = {
    config,
    lib,
    ...
  }:
    lib.mkIf config.host.hasScreen {
      services.blueman.enable = true;
      hardware.bluetooth.enable = true;
    };

  flake.modules.homeManager.bluetuith = {
    config,
    lib,
    ...
  }:
    lib.mkIf config.host.hasScreen {
      programs.bluetuith = {
        enable = true;
      };
    };
}
