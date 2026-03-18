_: {
  flake.modules.homeManager.udiskie = _: {
    services.udiskie = {
      enable = true;
      automount = false;
    };
  };
}
