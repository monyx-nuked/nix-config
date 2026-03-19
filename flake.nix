{
  description = "❄ My Nix config for my machines (Primarily NixOS) ";
  inputs = {
    # structure: flake-parts
    flake-parts = {
      url = "https://flakehub.com/f/hercules-ci/flake-parts/*";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };
    # imports: import-tree
    import-tree.url = "github:vic/import-tree";
    # nixpkgs: unstable
    nixpkgs.url = "https://flakehub.com/f/nixos/nixpkgs/0.1";
    # nixpkgs-lib: lib from nixpkgs
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
  };
  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
