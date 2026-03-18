{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs) nixpkgs determinate nur home-manager nixos-wsl;

  nixosModules = builtins.attrValues config.flake.modules.nixos;
  homeManagerModules = builtins.attrValues config.flake.modules.homeManager;

  # Secrets modules (CI-safe: when overridden with nixpkgs, these are empty)
  secretNixosModules =
    if (inputs.secrets ? modules.nixos)
    then builtins.attrValues inputs.secrets.modules.nixos
    else [];

  secretHomeModules =
    if (inputs.secrets ? modules.homeManager)
    then builtins.attrValues inputs.secrets.modules.homeManager
    else [];

  commonOverlays = {
    stable = import inputs.nixpkgs-stable {
      inherit (pkgs.stdenv.hostPlatform) system;
      config.allowUnfree = true;
    };
  };

  hostOptionsModule = {lib, ...}: {
    options.host = {
      hostname = lib.mkOption {
        type = lib.types.str;
        default = "nixos";
        description = "Hostname of this machine";
      };
      isLaptop = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether this a laptop";
      };
      hasNvidia = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether this machine has NVIDIA";
      };
      hasIntel = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether this machine has Intel";
      };
      hasScreen = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether this machine has screen";
      };
      stateVersion = lib.mkOption {
        type = lib.types.str;
        default = "25.11";
        description = "State Version of the NixOS for this host";
      };
      homeStateVersion = lib.mkOption {
        # HAS TO BE DEFINED INSIDE HOST MODULES
        type = lib.types.str;
        default = "25.11";
        description = "State Version of the Home-Manager for this host";
      };
    };
  };

  commonNixosModules = [
    hostOptionsModule
    {
      nixpkgs.overlays = [
        (_: _: commonOverlays)
      ];
    }
    determinate.nixosModules.default
    nixpkgs.nixosModules.notDetected
    nur.modules.nixos.default
    home-manager.nixosModules.home-manager
  ];

  commonHomeManagerSettings = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "home-manager-backup";
    sharedModules =
      homeManagerModules
      ++ secretHomeModules
      ++ [
        nur.modules.homeManager.default
        # Reconsider about these
        # sops-nix.homeManagerModules.sops
        # Note: stylix home-manager module is injected by stylix.nixosModules.stylix
        # Note: niri home-manager module is injected by niri.nixosModules.niri
      ];
  };

  mkHost = {
    name,
    hostModule,
    hostConfig,
    extraModules ? [],
  }:
    nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit (inputs) secrets;
      };
      modules =
        commonNixosModules
        ++ nixosModules
        ++ secretNixosModules
        ++ [
          # Host-specific hardware, settings module
          hostModule

          # Set host options
          {
            host = hostConfig;
          }

          {
            home-manager =
              commonHomeManagerSettings
              // {
                users.monyx = _: {
                  home.stateVersion = hostConfig.homeStateVersion;
                };
              };
          }
        ]
        ++ extraModules;
    };
in {
  flake.nixosConfigurations = {
    meowscarada = mkHost {
      name = "meowscarada";
      hostModule = ./_hosts/meowscarada;
      hostConfig = {
        hostname = "meowscarada";
        isLaptop = true;
        hasNvidia = true;
        hasIntel = true;
        hasScreen = true;
        stateVersion = "25.11";
        homeStateVersion = "25.11";
      };
    };
    necrozma = mkHost {
      name = "necrozma";
      hostModule = ./_hosts/necrozma;
      hostConfig = {
        hostname = "necrozma";
        isLaptop = false;
        hasNvidia = false;
        hasIntel = false;
        hasScreen = false;
        stateVersion = "25.11";
        homeStateVersion = "25.11";
      };
      extraModules = [
        nixos-wsl.nixosModules.default
      ];
    };
  };
}
