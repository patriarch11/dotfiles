function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if [ -n "$(cat -- "$tmp")" ] && [ "$(cat -- "$tmp")" != "$PWD" ]; then
        cd -- "$(cat -- "$tmp")"
    fi
    rm -f -- "$tmp"
}
