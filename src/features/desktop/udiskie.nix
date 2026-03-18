{...}: {
  flake.modules.homeManager.udiskie = {...}: {
    services.udiskie = {
      enable = true;
      automount = false;
    };
  };
}
