alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='LC_ALL=C ls -alh --group-directories-first --sort=name --color=auto'
alias grep='grep -iE --color=auto'
alias cat='bat'
alias v='nvim'
alias c='clear'
alias his='history'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# >>> git >>>
alias lg='lazygit'
alias gl='git log --all --graph --color=auto'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull --rebase'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gplb='git pull --rebase origin $(git rev-parse --abbrev-ref HEAD)'
alias gplm='git pull --rebase origin main'
# <<< git <<<

# >>> tmux >>>
# tmux sessions manage
alias tls='tmux ls'
alias tns='tmux new-session -d -t'
alias tks='tmux kill-session -t'
alias ta='tmux attach -t'
alias td='tmux detach'
# tmux windows manage
alias tnw='tmux new-window -n'
alias tkw='tmux kill-window -t'
alias tn='tmux next-window'
alias tp='tmux previous-window'
# tmux panes manage
alias th='tmux split-window -h'
alias tv='tmux split-window -v'
alias tsp='tmux select-pane -t'
alias tkp='tmux kill-pane'
# <<< tmux <<<

# >>> fzf >>>
alias fzf='fzf --height 40% --layout reverse --border --ansi --multi'
# <<< fzf <<<

# >>> bat >>>
alias bat='bat --style=plain --color=always --paging=never --theme=ansi'
# <<< bat <<<