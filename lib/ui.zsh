# UI Utilities for ClamChowder

# Colors
readonly CLAM_COLOR_BLUE='\033[0;34m'
readonly CLAM_COLOR_GREEN='\033[0;32m'
readonly CLAM_COLOR_YELLOW='\033[0;33m'
readonly CLAM_COLOR_RED='\033[0;31m'
readonly CLAM_COLOR_RESET='\033[0m'

function clam_info() {
    echo -e "${CLAM_COLOR_BLUE}[INFO]${CLAM_COLOR_RESET} $1"
}

function clam_success() {
    echo -e "${CLAM_COLOR_GREEN}[SUCCESS]${CLAM_COLOR_RESET} $1"
}

function clam_warn() {
    echo -e "${CLAM_COLOR_YELLOW}[WARN]${CLAM_COLOR_RESET} $1"
}

function clam_error() {
    echo -e "${CLAM_COLOR_RED}[ERROR]${CLAM_COLOR_RESET} $1" >&2
}

function clam_header() {
    echo -e "${CLAM_COLOR_BLUE}=== $1 ===${CLAM_COLOR_RESET}"
}
