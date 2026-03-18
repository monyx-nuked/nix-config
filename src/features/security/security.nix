_: {
  flake.modules.nixos.security = {pkgs, ...}: {
    # FIXME: consider adding gnome-keyring or not
    # services.gnome.gnome-keyring.enable = true;
    environment.systemPackages = with pkgs; [
      libsecret
    ];
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    # programs.seahorse.enable = true; # ^^
    security.sudo.extraConfig = ''
      Defaults:root,%wheel timestamp_timeout=30
    '';
    users.users.monyx.extraGroups = ["wheel"];
  };
}
