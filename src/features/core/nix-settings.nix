{inputs, ...}: {
  flake.modules.nixos.nix-settings = {pkgs, ...}: {
    nix = {
      settings = {
        extra-trusted-users = [
          "monyx"
          "@wheel"
          "@sudo"
        ];
        extra-substituters = [
          "https://nix-community.cachix.org"
          "https://install.determinate.systems"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
        ];
        extra-experimental-features = [
          "nix-command"
          "flakes"
          "pipe-operators"
        ];
      };

      nixPath = [
        "nixpkgs=${inputs.nixpkgs}"
        "nixpkgs-stable=${inputs.nixpkgs-stable}"
      ];
    };

    nixpkgs.config.allowUnfree = true;
  };
}
