{...}: {
  flake.modules.homeManager.direnv = {...}: {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      config.strict_env = true;
    };
  };
}
