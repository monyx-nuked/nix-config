{inputs, ...}: {
  flake.modules.nixos.nix-settings = {pkgs, ...}: {
    nix = {
      settings = {
        eval-cores = 0; # Determinate Package Manager special feature
        extra-trusted-users = [
          "monyx"
          "@wheel"
          "@sudo"
        ];
        extra-substituters = [
          "https://nix-community.cachix.org"
          "https://install.determinate.systems"
          "https://monyx-nix-config.cachix.org"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
          "monyx-nix-config.cachix.org-1:Z8BLQ0CFcXVxq67jpyfgIkHy4/HCghQp4/vsDdNUG9w="
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
