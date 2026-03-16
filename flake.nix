{
  description = "Flake for My Nix Configurations";
  inputs = {
    # structure: flake-parts
    flake-parts = {
      url = "https://flakehub.com/f/hercules-ci/flake-parts/*";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    # nix's better altarnative
    determinate.url = "https://flakehub.com/f/determinatesystems/determinate/*";
    # nixpkgs or repos
    nixpkgs.url = "https://flakehub.com/f/nixos/nixpkgs/0.1";
    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    # modules importer: import-tree
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
