_: {
  flake.modules.nixos.nvidia = {
    config,
    lib,
    ...
  }:
    lib.mkIf config.host.hasNvidia {
      services.xserver.videoDrivers = lib.mkAfter ["nvidia"];
      hardware.nvidia = {
        prime.offload.enableOffloadCmd = true;
        open = true;
        modesetting.enable = true;
        package = config.boot.kernelPackages.nvidiaPackages.production;
      };
    };
}
