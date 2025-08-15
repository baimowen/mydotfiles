{ config, pkgs, ... }:

{
  imports = [
    # ./fonts/default.nix
    # ./programs/browser/firefox/default.nix
    # ./programs/browser/zen/default.nix
    # ./programs/cli/btop/default.nix
    ./programs/cli/direnv/default.nix
    ./programs/cli/fastfetch/default.nix
    ./programs/cli/lf/default.nix
    ./programs/cli/starship/default.nix
    ./programs/cli/tmux/default.nix
    ./programs/editor/neovim/default.nix
    ./programs/editor/nixvim/default.nix
    # ./programs/editor/vscode/default.nix
  ];

  nixpkgs.config.allowUnfree = true;  # allow unfree software

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "nix";
  home.homeDirectory = "/home/nix";
  home.packages = with pkgs; [
    pkgs.openssh pkgs.networkmanager pkgs.fontconfig
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}