_: {
  flake.modules.nixos.gvfs = _: {
    services.gvfs.enable = true;
  };
}
