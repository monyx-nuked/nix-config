{...}: {
  flake.modules.nixos.bluetooth = {...}: {
    services.blueman.enable = true;
    hardware.bluetooth.enable = true;
  };

  flake.modules.homeManager.bluetuith = {...}: {
    programs.bluetuith = {
      enable = true;
    };
  };
}
