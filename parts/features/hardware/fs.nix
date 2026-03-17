{...}: {
  flake.modules.nixos.fs = {...}: {
    services.fstrim.enable = true;
  };
}
