_: {
  flake.modules.nixos.printing = {
    pkgs,
    config,
    lib,
    ...
  }:
    lib.mkIf config.host.hasScreen {
      services = {
        printing = {
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
        ipp-usb.enable = true;
        avahi = {
          # Required for printing net-discovery
          enable = true;
          nssmdns4 = true;
          openFirewall = true;
        };
      };
      # Extra Groups
      users.users.monyx.extraGroups = ["lpadmin"];
    };
}
