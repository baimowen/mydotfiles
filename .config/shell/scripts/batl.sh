batl() {
    local file="$1"
    local lang=""

    # 根据文件后缀匹配语言
    case "$file" in
        *.conf|*.ini)   lang="ini" ;;
        *.json)         lang="json" ;;
        *.yaml|*.yml)  lang="yaml" ;;
        *.sh|*.zsh|*.bash) lang="sh" ;;
        *.py)           lang="python" ;;
        *.js)           lang="javascript" ;;
        *.html)         lang="html" ;;
        *.css)          lang="css" ;;
        *.md)           lang="markdown" ;;
        *.toml)         lang="toml" ;;
        *.rs)           lang="rust" ;;
        *.go)           lang="go" ;;
        *)              lang="" ;;  # 自动检测
    esac

    # 调用 bat 并传递语言参数
    if [ -n "$lang" ]; then
        command bat --language="$lang" "$@"
    else
        command bat "$@"
    fi
}