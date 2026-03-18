{...}: {
  flake.modules.nixos.printing = {
    pkgs,
    config,
    lib,
    ...
  }:
    lib.mkIf config.host.hasScreen {
      services.printing = {
        enable = true;
        listenAddresses = ["127.0.0.1:631"];
        drivers = with pkgs; [
          # Net-discovery
          cups-filters
          cups-browsed
          # Drivers
          gutenprint
          ghostscript
          gutenprintBin
          epson-escpr2
        ];
      };
      services.ipp-usb.enable = true;
      # Extra Groups
      users.users.monyx.extraGroups = ["lpadmin"];
      services.avahi = {
        # Required for printing net-discovery
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
}
