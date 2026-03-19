{
  description = "❄ My Nix config for my machines (Primarily NixOS) ";
  inputs = {
    # structure: flake-parts
    flake-parts = {
      url = "https://flakehub.com/f/hercules-ci/flake-parts/*";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    # nixpkgs: unstable
    nixpkgs.url = "https://flakehub.com/f/nixos/nixpkgs/0.1";
  };
  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
