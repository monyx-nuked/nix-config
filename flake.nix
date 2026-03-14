{
  description = "Flake for Nix Configuration";

  inputs = {
    ###############
    # determinate #
    ###############
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    ###########
    # nixpkgs #
    ###########
    # latest unstable version
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    # latest stable version
    nixpkgs-stable.url = "https://flakehub.com/f/NixOS/nixpkgs/*";

    ################
    # home-manager #
    ################
    home-manager = {
      # latest unstable version
      url = "https://flakehub.com/f/nix-community/home-manager/0.1";
      # latest stable version
      # url = "https://flakehub.com/f/nix-community/home-manager/*";

      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs dependencies.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ###############
    # flake-parts #
    ###############
    flake-parts.url = "https://flakehub.com/f/hercules-ci/flake-parts/*";

    ##########
    # haumea #
    ##########
    haumea = {
      url = "https://flakehub.com/f/nix-community/haumea/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #######
    # nur #
    #######
    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: 
    inputs.flake-parts.lib.mkFlake {inherit inputs;} ({...}: {
      systems = [
        "x86_64-linux"
      ];

      imports = [

      ];
    })
  ;
}