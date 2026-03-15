{
  description = "Flake for NixOS configurations";
  inputs = {
    # unstable
    nixpkgs.url = "https://flakehub.com/f/nixos/nixpkgs/0.1";
  };
  outputs = inputs@{ nixpkgs, ... }:
  {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {};
  };
}