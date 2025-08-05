# [ -f "$HOME/.config/dircolors" ] && eval $(dircolors "$HOME/.config/dircolors")
DCOLORS_PATHS=(
    "$HOME/.config/dircolors"
    "$HOME/.dir_colors"
    "$HOME/.dircolors"
    "/etc/DIR_COLORS"
    "/usr/bin/dircolors"
)

if ! command -v dircolors >/dev/null 2>&1; then
    echo "[WARN] dircolors command not found - using default colors" >/dev/null
    return 1
fi

for config in "${DCOLORS_PATHS[@]}"; do
    if [[ -f "$config" ]]; then
        if eval "$(dircolors -b "$config" 2>/dev/null)"; then
            echo "[INFO] Applied dircolors from: $config" >/dev/null
            return 0
        else
            echo "[WARN] Failed to apply dircolors from: $config" >/dev/null
        fi
    fi
done

echo "[INFO] No valid dircolors found - using defaults" >/dev/null
eval "$(dircolors -b 2>/dev/null)"
return 1