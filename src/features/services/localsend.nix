_: {
  flake.modules.nixos.localsend = _: {
    programs.localsend = {
      enable = true;
      openFirewall = true;
    };
  };
}
