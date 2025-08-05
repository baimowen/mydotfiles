killfzf() {
  local pid=$(ps -aux | fzf | awk '{print $2}')
  if [[ -n "$pid" ]]; then
    kill "$pid"
  fi
}