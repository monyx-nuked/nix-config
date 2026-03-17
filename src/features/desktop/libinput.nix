{...}: {
  flake.modules.nixos.libinput = {...}: {
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
