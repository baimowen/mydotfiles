{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;
    history.path = "\${XDG_DATA_HOME}/.zsh_history";
    dotDir = "\${XDG_DATA_HOME}/.zsh";

    shellAliases = {

        cp = "cp -i";
        mv = "mv -i";
        rm = "rm -i";
        ls = "LC_ALL=C ls -alh --group-directories-first --sort=name --color=auto";
        grep = "grep -iE --color=auto";
        # cat = "bat";
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
          rev = "b3e86492d6d48c669902b9fb5699a75894cfcebc";
          sha256 = "+yMZO4HRF+dS1xOP/19Fneto8JxdVj5GiX3sXOoRdlM=";
        };
      }
    ];

    initExtra = ''
      # emacs
      bindkey -e

      # Improve terminal colors
      export TERM="xterm-256color"

      # keybings
      bindkey "^I" complete-word
      bindkey '^a' beginning-of-line
      bindkey '^e' end-of-line
      bindkey '^w' backword-kill-word
      bindkey "^[[1;5C" forward-word   # Ctrl + →
      bindkey "^[[1;5D" backward-word  # Ctrl + ←
    '';
  };
}
