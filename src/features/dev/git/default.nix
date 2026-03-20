_: {
  flake.modules.homeManager.git =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        delta # syntax highlighter for git
        github-cli
        glab
	gitmoji-cli
      ];

      programs = {
        difftastic = {
          enable = true;
          git.enable = true;
        };

        git = {
          enable = true;
          settings = {
            user.email = "helix.nuked@proton.me";
            user.name = "monyx-nuked";
          };
        };

        mergiraf = {
          enable = true;
          enableGitIntegration = true;
        };
      };
    };
}
