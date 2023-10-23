{ config, pkgs, ... }:

let

  unstable = import <unstable> { config = { allowUnfree = true; }; };

in

{
  imports = [ ./zsh.nix ];
  home.username = "hasibur";
  home.homeDirectory = "/home/hasibur";

  home.stateVersion = "23.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    # CLI Programs
    nodePackages.pnpm
    ngrok
    neovim
    nodejs_20
    helix
    git
    git-crypt
    gnupg
    exa
    ncdu
    lf
    nil
    nixpkgs-fmt
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.prettier
    # GUI Programs
    gnome.gnome-tweaks
    alacritty
    fragments
    brave
    google-chrome
    vlc
    unstable.vscode
    postman
    zoom-us

    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "alacritty";
    #    PNPM_HOME = "/home/hasibur/.pnpm/global";
    #    PATH = "$PNPM_HOME:$PATH";
  };

  programs.git = {
    enable = true;
    userName = "Hasibur Rahman";
    userEmail = "hasiburdev@gmail.com";
  };

  home.file.".config/alacritty/alacritty.yml".source = ./alacritty.yml;
  home.file.".config/helix/config.toml".source = ./helix/config.toml;
  home.file.".config/helix/languages.toml".source = ./helix/languages.toml;

  programs.home-manager.enable = true;
}
