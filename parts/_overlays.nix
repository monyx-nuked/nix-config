# This is a template and I do not reccomend using it
{inputs, ...}: {
  perSystem = {system, ...}: let
    commonOverlays = {
      stable = import inputs.nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    };
  in {
    _module.args.pkgs = import inputs.nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        (_: _: commonOverlays)
      ];
    };
  };
}
