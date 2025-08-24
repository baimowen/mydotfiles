{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
    
    # stdlib = ''
      # use flake ~/nixos#default
      # 
      # if [[ -f .envrc ]]; then
        # source_env .envrc
      # elif [[ -f .env ]]; then
        # source_env .env
      # elif [[ -f pyproject.toml ]] || [[ -f requirements.txt ]] || [[ -f setup.py ]]; then
        # use flake ~/nixos#python
      # elif [[ -f CMakeLists.txt ]] || [[ -f Makefile ]] || [[ -f configure.ac ]]; then
        # use flake ~/nixos#c_cpp
      # elif [[ -f Dockerfile ]] || [[ -f docker-compose.yml ]]; then
        # use flake ~/nixos#container
      # fi
    # '';
  }; 
}
