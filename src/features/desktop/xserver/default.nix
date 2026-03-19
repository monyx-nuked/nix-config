_: {
  flake.modules.nixos.xserver =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    lib.mkIf config.host.hasScreen {
      services.xserver = {
        enable = true;
        excludePackages = with pkgs; [ xterm ];
      };
    };
}
