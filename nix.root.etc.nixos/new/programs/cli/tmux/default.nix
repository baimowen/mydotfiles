{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # ~/.tmux.conf
      # ╭──────────────────────────────────────────────────────────╮
      # │                         Shell                            │
      # ╰──────────────────────────────────────────────────────────╯
      set -g default-command "exec zsh -l"
      # set-option -g default-command "reattach-to-user-namespace -l $SHELL"

      # ╭──────────────────────────────────────────────────────────╮
      # │                         Prefix                           │
      # ╰──────────────────────────────────────────────────────────╯
      unbind C-b
      set -g prefix `
      bind ` send-prefix

      # ╭──────────────────────────────────────────────────────────╮
      # │                         Options                          │
      # ╰──────────────────────────────────────────────────────────╯
      set -g default-terminal "tmux-256color"
      set -g base-index 1
      set -g pane-base-index 1
      set -g renumber-windows on
      set -g mouse on
      set -g set-clipboard on  # ensure wl-copy is installed

      # -- vi mod
      # prefix + [ 进入复制模式
      # v 选择文本  y 复制文本  enter 复制并退出复制模式
      # /,? 搜索文本
      set -g mode-keys vi
      set -g status-keys vi

      # ╭──────────────────────────────────────────────────────────╮
      # │                       functions                          │
      # ╰──────────────────────────────────────────────────────────╯
      # none

      # ╭──────────────────────────────────────────────────────────╮
      # │                        bindkeys                          │
      # ╰──────────────────────────────────────────────────────────╯
      # window control
      bind q new-window -c "#{pane_current_path}"
      bind c kill-window
      bind -r n next-window
      bind -r p previous-window

      # pane control
      bind t split-window -h -c "#{pane_current_path}"
      bind w kill-pane
      bind -n M-h split-window -h -c "#{pane_current_path}"  # split-window -h
      bind -n M-v split-window -v -c "#{pane_current_path}"  # split-window -v
      bind -r j select-pane -U
      bind -r k select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R
      bind -r M-j resize-pane -U 5
      bind -r M-k resize-pane -D 5
      bind -r M-h resize-pane -L 5
      bind -r M-l resize-pane -R 5

      # vi mod
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      # other
      bind u clock-mode
      bind s choose-tree -w
      bind e display-panes
    '';

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      # {
      #   plugin = resurrect;
      #   extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      # }
      # {
      #   plugin = continuum;
      #   extraConfig = ''
      #     set -g @continuum-restore 'on'
      #     set -g @continuum-save-interval '15'
      #   '';
      # }
      vim-tmux-navigator
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'mocha'";
      }
    ];
  };
}