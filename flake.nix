{
  description = "Flake for My Nix Configurations";
  nixConfig = {
    cores = 0;
    extra-trusted-users = [
      "monyx" # ADD TRUSTED USERS IN YOUR OWN CONFIG
    ];
    extra-experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://install.determinate.systems"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
    ];
  };
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
