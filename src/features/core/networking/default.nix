{...}: {
  flake.modules.nixos.networking = {
    config,
    lib,
    pkgs,
    ...
  }: {
    networking.networkmanager.enable = true;
    users.users.monyx.extraGroups = ["networkmanager"];
    # Disable dhcpcd in favor of NetworkManager
    networking.dhcpcd.enable = false;
    # Disable waiting for network connectivity
    systemd.network.wait-online.enable = false;
  };
}
