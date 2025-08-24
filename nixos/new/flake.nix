{
  # sudo nixos-rebuild switch --flake .#<hostname>
  description = "My dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          modules = [
            ./host/configuration.nix
            ./modules/programs/cli/direnv/default.nix
          ];
        };
      };
      homeConfigurations = {
        nix = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./modules/home-manager/home.nix
            ./modules/programs/cli/fastfetch/default.nix
            ./modules/programs/cli/tmux/default.nix
            ./modules/programs/cli/starship/default.nix
            ./modules/programs/cli/zsh/default.nix
            ./modules/programs/cli/git/default.nix
            ./modules/programs/cli/fzf/default.nix
            ./modules/programs/cli/btop/default.nix
            ./modules/programs/cli/cava/default.nix
          ];
        };
      };
    };
}

