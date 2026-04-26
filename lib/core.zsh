# Core Logic for ClamChowder

# Check if a command is managed by ClamChowder
function is_valid_command() {
    local cmd_name=$1
    [[ -d "${CLAM_COMMANDS_DIR}/${cmd_name}" ]]
}

# Source config/main for a command
function source_cmd_config() {
    local cmd_name=$1
    local config_file="${CLAM_COMMANDS_DIR}/${cmd_name}/config/main.zsh"
    if [[ -f "$config_file" ]]; then
        source "$config_file"
    fi
}
