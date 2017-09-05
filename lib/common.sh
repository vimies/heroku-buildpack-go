
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

env_variable() {
    if [ $# -lt 2 ]; then
        fatal "env_variable: missing argument(s)"
    fi

    local env_dir name
    env_dir=$1
    name=$2

    path="$env_dir/$name"
    if [ -f "$path" ]; then
        cat $path
    fi
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
