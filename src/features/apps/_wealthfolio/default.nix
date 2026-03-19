_: {
  flake.modules.homeManager.wealthfolio =
    { pkgs, ... }:
    let
      wealthfolio = pkgs.wealthfolio.overrideAttrs (oldAttrs: rec {
        version = "3.1.2";

        src = pkgs.fetchFromGitHub {
          owner = "afadil";
          repo = "wealthfolio";
          tag = "v${version}";
          hash = "sha256-JLflqtT24VIGbMIndLqXApEkhbV1kEJT7FcBvO5Kx0g=";
        };

        pnpmDeps = pkgs.fetchPnpmDeps {
          inherit src;
          pname = "wealthfolio";
          inherit version;
          pnpm = pkgs.pnpm_9;
          fetcherVersion = 1;
          hash = "sha256-feM1jQsUDKVX4+x4Otdwx6AEM+FO7fiaJjmMbU6GDf8=";
        };

        cargoRoot = ".";
        buildAndTestSubdir = cargoRoot;

        cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
          inherit src cargoRoot;
          pname = "wealthfolio";
          inherit version;
          hash = "sha256-r01/Y4l52gESRKbDGTY8tI8r5MRSyRHa77/+UV/4wV8=";
        };

        postPatch = ''
          jq \
            '.plugins.updater.endpoints = [ ]
            | .bundle.createUpdaterArtifacts = false' \
            apps/tauri/tauri.conf.json \
            | sponge apps/tauri/tauri.conf.json
        '';
      });

      wealthfolio-wrapper = pkgs.writeShellApplication {
        name = "wealthfolio-wrapper";
        runtimeInputs = [
          wealthfolio
          pkgs.gocryptfs
          pkgs.zenity
          pkgs.util-linux
          pkgs.coreutils
          pkgs.procps
        ];
        text = builtins.readFile ./wealthfolio-wrapper.sh;
      };
    in
    {
      home.packages = [
        wealthfolio
        wealthfolio-wrapper
      ];

      xdg.desktopEntries.Wealthfolio = {
        name = "Wealthfolio";
        exec = "wealthfolio-wrapper";
        terminal = false;
        type = "Application";
        categories = [
          "Office"
          "Finance"
        ];
        icon = "com.teymz.wealthfolio";
      };
    };
}
