{...}: {
  flake.modules.homeManager.git = {pkgs, ...}: {
    home.packages = with pkgs; [
      delta # syntax highlighter for git
      github-cli
      glab
    ];

    programs.difftastic = {
      enable = true;
      git.enable = true;
    };

    programs.git = {
      enable = true;
      user.email = "helix.nuked@proton.me";
      user.name = "monyx-nuked";
    };

    programs.mergiraf.enable = true;
  };
}
