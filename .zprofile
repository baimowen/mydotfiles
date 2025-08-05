[ -f ~/.zshrc ] && source ~/.zshrc

# if [ -z "${WAYLAND_DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
#     exec Hyprland
# fi

# if ! pgrep -u $USER pulseaudio > /dev/null; then
#     pulseaudio --start
# fi

# cava xterm-256color
export TERM=xterm-256color

# [[ ! -p /tmp/mpd.fifo ]] && (rm -f /tmp/mpd.fifo && mkfifo /tmp/mpd.fifo && chmod 666 /tmp/mpd.fifo)