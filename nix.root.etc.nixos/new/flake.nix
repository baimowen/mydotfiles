{
    # 描述
    description = "Home Manager configuration";

    # 依赖项
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  # 软件包源 nixpkgs
        flake-utils.url = "github:numtide/flake-utils";  # 简化多系统支持，无需硬编码
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:Sly-Harvey/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        # zen-browser = {
        #     url = "github:maximoffua/zen-browser.nix";
        #     inputs.nixpkgs.follows = "nixpkgs";
        # };
    };

    # 构建
    outputs = { 
        self,
        nixpkgs,
        flake-utils,
        home-manager,
        nixvim,
        ... 
    } @ inputs:
    # 多系统支持 flake-utils.lib.eachDefaultSystem
    flake-utils.lib.eachDefaultSystem (system:
        let
            pkgs = import nixpkgs { inherit system; };
        in {
            # devShells.default 默认开发环境入口
            devShells.default = pkgs.mkShell { 
                shellHook = '' 
                    echo "Hello from devShell!"
                '';  # 进入环境自动执行的命令（类似.bashrc/.zshrc）
            };  # mkShell 创建可交互的shell环境
        }
    )  // {
        homeConfigurations."nix" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        modules = [ ./home.nix ];
        extraSpecialArgs = { inherit inputs; };  # 传递 inputs 给 home.nix
        };
    };

}