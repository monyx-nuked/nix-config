{ inputs, ... }:
{
  flake.modules.nixos.dev-nix =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.fh.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
