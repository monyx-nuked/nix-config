{inputs, ...}: {
  flake.overlays.unstable = final: _: {
    unstable = import inputs.nixpkgs {
      inherit (final) system;
      config.allowUnfree = true;
    };
  };
}
