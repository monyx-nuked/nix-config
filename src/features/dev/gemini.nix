_: {
  flake.modules.nixos.gemini = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.gemini-cli
    ];
  };
}
