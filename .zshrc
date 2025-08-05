case $- in  # check shell options
    *i*) ;;  # interactive shell
      *) return;;  # don't do anything
esac

load_file() {
    local file="$1"
    if [[ -f "$file" ]]; then
        if source "$file" 2>/dev/null; then
            return 0
        else
            echo >&2 "[WARN] Failed to load: $file"
            return 1
        fi
    else
        echo >&2 "[INFO] File not found, skipping: $file"
        return 1
    fi
}

_CONFIG_FILES="${HOME}/.config/shell"
_FUNCTIONS_DIR="${_CONFIG_FILES}/scripts"
_ZSH_PLUGIN_HOME="${HOME}/.zsh"

# config files
for config_file in "${_CONFIG_FILES}"/*.{sh,zsh}(N); do
    load_file "$config_file"
done

# custom functions
for func_file in "${_FUNCTIONS_DIR}"/*.{sh,zsh}(N); do
    load_file "$func_file"
done

# git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
# git clone https://github.com/zap-zsh/sudo.git $HOME/.zsh/zsh-sudo
# git clone https://github.com/catppuccin/zsh-syntax-highlighting.git $HOME/.zsh/zsh-catppuccin
# git clone https://github.com/unixorn/fzf-zsh-plugin.git $HOME/.zsh/fzf-zsh-plugin
# git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh/zsh-syntax-highlighting
# zsh plugins
for plugin_dir in "${_ZSH_PLUGIN_HOME}"/*(N); do
    if [[ "$plugin_dir" != */zsh-syntax-highlighting ]]; then
        for plugin_file in "$plugin_dir"/*.{zsh,plugin.zsh}(N); do
            load_file "$plugin_file"
        done
    fi
done
[ -f "${_ZSH_PLUGIN_HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
    load_file "${_ZSH_PLUGIN_HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" || \
    echo >&2 "[Warning] load zsh-syntax-highlighting faild, skipping"

export EDITOR=vim
export VISUAL=vim
export MANPAGER="nvim +Man!"

# starship
eval "$(starship init zsh)"

# fzf
[ -f ${_CONFIG_FILES}/fzf.zsh ] && source ${_CONFIG_FILES}/fzf.zsh || echo >&2 "[Warning] load fzf.zsh faild, skipping"
# source <(/usr/bin/fzf --zsh)