{ inputs, ... }:
{
  flake.modules.nixos.nix-settings =
    { pkgs, ... }:
    {
      nix = {
        nixPath = [
          "nixpkgs=${inputs.nixpkgs}"
          "nixpkgs-stable=${inputs.nixpkgs-stable}"
        ];
      };

      nixpkgs.config.allowUnfree = true;
    };
}
