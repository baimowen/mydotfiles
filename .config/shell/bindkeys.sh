# vi
# bindkey -v
# export KEYTIMEOUT=1
# bindkey '^R' history-incremental-search-backward
# bind key: esc esc -> sudo
# bindkey -M viins '\e\e' sudo
# bindkey -M vicmd '\e\e' sudo
bindkey -r "^I"
bindkey "^I" complete-word