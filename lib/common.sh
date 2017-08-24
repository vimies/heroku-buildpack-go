
action() {
    echo "-----> $*"
}

info() {
    echo "       $*"
}

error() {
    echo "\e[31m-----> $*\e[0m"
}

fatal() {
    echo "\e[31m-----> $*\e[0m"
    exit 1
}

download_file() {
    if [ $# -lt 2 ]; then
        fatal "download_file: missing argument(s)"
    fi

    local file dest
    file=$1
    dest=$2

    local url
    url="$heroku_bucket/$file"

    info "downloading $url to $dest"

    curl -s -L --retry 3 --retry-delay 1 -o $dest $url
}
