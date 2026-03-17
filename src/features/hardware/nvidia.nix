{...}: {
  flake.modules.nixos.nvidia = {
    config,
    lib,
    ...
  }: {
    services.xserver.videoDrivers = lib.mkAfter ["nvidia"];
    hardware.nvidia = {
      prime.offload.enableOffloadCmd = true;
      open = true;
      modesetting = true;
      nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };
}
