{
  description = "Flake for My Nix Configurations";
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/nixos/nixpkgs/0.1";
    # nix-index-database = {
    #   url = "github:nix-community/nix-index-database";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    flake-parts.url = "https://flakehub.com/f/hercules-ci/flake-parts/*";
  };
  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} ({...}: {
      imports = [
        ./parts/devshell.nix
      ];
      systems = [
        "x86_64-linux"
      ];
    });
}
