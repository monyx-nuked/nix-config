{
  description = "Flake for My Nix Configurations";
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/nixos/nixpkgs/0.1";
    # nix-index-database = {
    #   url = "github:nix-community/nix-index-database";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in {
    devShells.${system}.default = pkgs.mkShellNoCC {
      packages = with pkgs; [
        # Tools for Nix and NixOS systems
        alejandra
        nix-melt
        nix-tree
        nh
        deadnix
        # Options seachers
        manix
        optnix
        devenv
      ];
      shellHook = ''
        cat ./res/devshell.txt
      '';
    };
  };
}
