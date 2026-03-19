_: {
  flake.modules.nixos.power =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    lib.mkIf config.host.hasScreen {
      # This may save your battery but totally save your money
      services.thermald.enable = true;
      services.logind = {
        settings = {
          Login = {
            HandleLidSwitch = "suspend-then-hibernate";
            HandleLidSwitchDocked = "lock";
            HandleLidSwitchExternalPower = "lock";
          };
        };
      };
      systemd.sleep.settings.Sleep = {
        HibernateDelaySec = "1h";
      };
      # Research into this later on
      # services.auto-cpufreq = {
      #   enable = true;
      #   settings = {};
      # };
      # security.sudo.extraRules = [
      #   {
      #     users = ["monyx"];
      #     commands = [
      #       {
      #         command = "${pkgs.auto-cpufreq}/bin/auto-cpufreq --force *";
      #         options = ["NOPASSWD" "SETENV"];
      #       }
      #       {
      #         command = "/run/current-system/sw/bin/auto-cpufreq --force *";
      #         options = ["NOPASSWD" "SETENV"];
      #       }
      #     ];
      #   }
      # ];

      # Dbus service providing historical battery life stats, ...
      # services.upower.enable = true;
    };
}
