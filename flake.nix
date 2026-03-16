{
  description = "Flake for My Nix Configurations";
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/nixos/nixpkgs/0.1";
    # nix-index-database = {
    #   url = "github:nix-community/nix-index-database";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    flake-parts.url = "https://flakehub.com/f/hercules-ci/flake-parts/*";
    import-tree.url = "github:vic/import-tree";
  };
  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} ({...}: {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      imports = [
        (inputs.import-tree ./parts)
      ];
    });
}
