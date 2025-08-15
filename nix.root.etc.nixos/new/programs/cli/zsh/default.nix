{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {


        cp = "cp -i";
        mv = "mv -i";
        rm = "rm -i";
        ls = "LC_ALL=C ls -alh --group-directories-first --sort=name --color=auto";
        grep = "grep -iE --color=auto";
        cat = "bat";
        v = "nvim";
        c = "clear";
        his = "history";
        df = "df -h";
        du = "du -h";
        free = "free -h";

        # >>> git >>>
        lg = "lazygit";
        gl = "git log --all --graph --color=auto";
        gs = "git status";
        ga = "git add";
        gc = "git commit -m";
        gps = "git push";
        gpl = "git pull --rebase";
        gco = "git checkout";
        gcb = "git checkout -b";
        gplb = "git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)";
        gplm = "git pull --rebase origin main";
        # <<< git <<<

        # >>> tmux >>>
        # tmux sessions manage
        tls = "tmux ls";
        tns = "tmux new-session -d -t";
        tks = "tmux kill-session -t";
        ta = "tmux attach -t";
        td = "tmux detach";
        # tmux windows manage
        tnw = "tmux new-window -n";
        tkw = "tmux kill-window -t";
        tn = "tmux next-window";
        tp = "tmux previous-window";
        # tmux panes manage
        th = "tmux split-window -h";
        tv = "tmux split-window -v";
        tsp = "tmux select-pane -t";
        tkp = "tmux kill-pane";
        # <<< tmux <<<

        # >>> fzf >>>
        fzf = "fzf --height 40% --layout reverse --border --ansi --multi";
        # <<< fzf <<<

        # >>> bat >>>
        bat = "bat --style=plain --color=always --paging=never --theme=ansi";
        # <<< bat <<<

        # >>> nixos >>>
        hms = "home-manager switch";
        nrs = "sudo nixos-rebuild switch";
        ncg = "sudo nix-collect-garbage -d";
        # <<< nixos <<<
    };

    plugins = [
      {
        name = "zap-zsh-sudo";
        src = pkgs.fetchFromGitHub {
          owner = "zap-zsh";
          repo = "sudo";
          rev = "v1.0.0";
          sha256 = "0h9i8b7fq7w8q8w8q8w8q8w8q8w8q8w8q8w8q8w8q8w8q8w8q8";
        };
      }
    ];

    initExtra = ''
      # Custom zsh initialization
      HISTSIZE=10000
      SAVEHIST=10000
      HISTFILE=~/.zsh_history
      setopt SHARE_HISTORY
      setopt HIST_IGNORE_DUPS
      
      # Load plugins manually
      source ${config.programs.zsh.plugins[2].src}/sudo.plugin.zsh
      
      # Improve terminal colors
      export TERM="xterm-256color"
    '';
  };
}