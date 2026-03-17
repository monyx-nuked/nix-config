{...}: {
  flake.modules.nixos.display-manager = {pkgs, ...}: {
    services.displayManager = {
      defaultSession = "plasma";
      ly = {
        enable = true;
        settings = {
          animation = "doom";
          hide_borders = true;
        };
      };
    };
    services.gvfs.enable = true;
    programs.xwayland.enable = true;
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
      ];
    };
    services.desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = true;
    };
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      elisa
      gwenview
      okular
      gwenview
      kate
      khelpcenter
      baloo-widgets
      dolphin-plugins
      krdp
      discover
    ];
  };
}
