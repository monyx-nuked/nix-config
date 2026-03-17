{...}: {
  flake.modules.nixos.intel = {pkgs, ...}: {
    services.xserver.videoDrivers = ["modesetting"];
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver # va-api
        intel-media-sdk # qsv
      ];
    };
    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
    # Enable GUC for efficiency
    boot.kernelParams = ["i915.enable_guc=3"];
    # Access groups
    users.users.monyx.extraGroups = ["render" "video"];
  };
}
