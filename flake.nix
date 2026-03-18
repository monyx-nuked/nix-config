{
  description = "Flake for My Nix Configurations";
  nixConfig = {
    cores = 0;
    auto-optimise-store = true;
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
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*";
    # nixpkgs or repos
    nixpkgs.url = "https://flakehub.com/f/nixos/nixpkgs/0.1";
    nixpkgs-stable.url = "https://flakehub.com/f/nixos/nixpkgs/*";
    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    # modules importer: import-tree
    import-tree.url = "github:vic/import-tree";
    # zen-browser
    zen-browser = {
      url = "https://flakehub.com/f/youwen5/zen-browser/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    secrets = {
      url = "github:monyx-nuked/empty-flake";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/0.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/nixos-wsl/main";
  };
  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} ({...}: {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      imports = [
        (inputs.import-tree ./src)
      ];
    });
}
