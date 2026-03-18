_: {
  flake.modules.nixos.systemd = _: {
    systemd.enableStrictShellChecks = true;
  };
}
