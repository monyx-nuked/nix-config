{...}: {
  flake.modules.homeManager.udiskie = {
    config,
    lib,
    ...
  }:
    lib.mkIf config.host.hasScreen {
      services.udiskie = {
        enable = true;
        automount = false;
      };
    };
}
