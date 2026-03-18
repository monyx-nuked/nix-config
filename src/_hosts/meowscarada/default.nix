{...}: {
  imports = [
    ./hardware-scan.nix
  ];
  boot.kernelParams = [
    "nvme_load=yes"
  ];
  # NVIDIA Specific settings
  hardware.nvidia.prime = {
    offload.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
  networking.hostName = "meowscarda";
  system.stateVersion = "25.11";
}
