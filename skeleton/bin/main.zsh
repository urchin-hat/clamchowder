#!/bin/zsh

# --- ClamChowder Operational Script: {{name}} ---
# @description: (Describe your command here)
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
fi

# @functions
# -------------------------

# Example: Render the documentation using 'mo'
function func_help() {
    export name="{{name}}"
    if [[ -f "$CMD_DOC/explanation.mo" ]]; then
        "$CLAM_MO" "$CMD_DOC/explanation.mo"
    else
        echo "Usage: {{name}} [subcommand] [args]"
    fi
}

# @validation
# -------------------------
# (Add your validation logic here)

# @main
# -------------------------

# Argument handling template
case $1 in
    ""|help|--help|-h)
        func_help
        exit 0
        ;;
    *)
        # Default behavior or subcommand routing
        # Example:
        # local sub_cmd=$1
        # shift
        # case $sub_cmd in
        #     sub1) echo "Running sub1 with $@" ;;
        #     *)    echo "Unknown command: $sub_cmd"; exit 1 ;;
        # esac

        echo "Command {{name}} executed with arguments: $@"
        ;;
esac

exit 0
