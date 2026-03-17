{...}: {
  flake.modules.nixos.audio = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      alsa-utils
      qpwgraph # more extensive patchbay for pipewire
    ];
    users.users.monyx.extraGroups = ["audio"];
    # pipewire
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
