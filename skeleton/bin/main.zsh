#!/bin/zsh

# --- ClamChowder Operational Script: {{name}} ---
# @creator: s-fukushima
# ---------------------------------------------------------

# @init
# -------------------------
readonly CMD_BIN=${0:A:h}
readonly CMD_ROOT=${CMD_BIN:h}
readonly CMD_DOC="${CMD_ROOT}/doc"
readonly CMD_SQL="${CMD_ROOT}/sql"
readonly CMD_CONFIG="${CMD_ROOT}/config/main.zsh"

# ClamChowder framework paths (set during cook)
readonly CLAM_MO="{{CLAM_MO}}"

# Load config
if [[ -f "$CMD_CONFIG" ]]; then
    source "$CMD_CONFIG"
else
    echo "Error: Config not found at $CMD_CONFIG" >&2
    exit 1
fi

# UI Decoration
HARF=$(($(tput cols) / 2))
LINE=$(printf '%.0s-' {1..$HARF})

# @functions
# -------------------------

# Show help (Taste the documentation)
function func_help() {
    export name="{{name}}"
    "$CLAM_MO" "$CMD_DOC/explanation.mo"
}

# Render query (Dry run)
function dryrun() {
    export ARG=$1
    "$CLAM_MO" "$CMD_SQL/query.sql"
}

# Execute query in MySQL
function run_query() {
    local query=$(dryrun "$1")
    # Using \G for vertical output as in your original script
    mysql -e "${query%;}\G"
}

# @validation
# -------------------------
# MySQL connection check
if ! mysql -e "show tables;" &>/dev/null; then
    echo "$LINE"
    echo "Port forward to MySQL(aws-rds ${DB_HOST:-unknown})"
    echo "$LINE"
    func_help
    exit 1
fi

# @main
# -------------------------

case $# in
    0)
        func_help
        exit 0
        ;;
    1)
        # Default behavior: run the query with 1st argument as parameter
        run_query "$1"
        ;;
    2)
        local op=$1
        local arg=$2
        case "$op" in
            --dry)
                dryrun "$arg"
                ;;
            --run)
                run_query "$arg"
                ;;
            --all)
                local query=$(dryrun "$arg")
                echo "$LINE"
                echo "| execute query"
                echo "$LINE"
                echo "$query"
                echo "$LINE"
                echo "| query result"
                echo "$LINE"
                run_query "$arg"
                ;;
            *)
                func_help
                exit 0
                ;;
        esac
        ;;
    *)
        func_help
        exit 1
        ;;
esac

exit 0
