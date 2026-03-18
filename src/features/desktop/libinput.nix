_: {
  flake.modules.nixos.libinput = {
    config,
    lib,
    ...
  }:
    lib.mkIf config.host.hasScreen {
      services.libinput = {
        enable = true;
        touchpad = {
          accelProfile = "flat";
        };
        mouse = {
          accelProfile = "flat";
        };
      };
    };
}
