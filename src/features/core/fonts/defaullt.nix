_: {
  flake.modules.nixos.fonts = {pkgs, ...}: {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        noto-fonts-color-emoji
        dejavu_fonts
        nerd-fonts.victor-mono # my favourite font
        nerd-fonts.jetbrains-mono # for readability
      ];
    };
  };
}
