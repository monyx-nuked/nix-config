_: {
  flake.modules.nixos.core-packages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wget
        wget2
        aria2
        helix
      ];
    };
}
