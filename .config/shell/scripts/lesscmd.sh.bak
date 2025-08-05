lesscmd() {
    if [ $# -eq 0 ]; then
        echo "Usage: lesscmd <command> [args...]"
        return 1
    fi
    less <("$@")
}