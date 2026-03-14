{
  description = "Flake for Nix Configuration";

  inputs = {
    ###########
    # nixpkgs #
    ###########
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1"; # latest unstable version
    nixpkgs-stable.url = "https://flakehub.com/f/NixOS/nixpkgs/*"; # latest stable version

    #######
    # nur #
    #######
  };

}