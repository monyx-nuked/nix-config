_: {
  flake.modules.nixos.performance = _: {
    documentation.man = {
      enable = true;
      cache.enable = false; # Used for apropos and the -k option of man, but slows down builds
    };
  };
}
