{...}: {
  flake.modules.homeManager.discord = {...}: {
    programs.discord = {
      enable = true;
    };
  };
}
