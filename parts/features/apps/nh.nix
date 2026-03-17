{...}: {
  flake.modules.homeManager.nh = {config, ...}: {
    programs.nh = {
      enable = true;
      flake = "${config.home.homeDirectory}/nix-config";
    };
  };
}
