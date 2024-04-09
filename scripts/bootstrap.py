import sys

from packages import install_git_completion
from symlinks import create_symlinks
from utils import load_config, output

if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: python3 bootstrap.py <config_path> <base_path> <force_flag>")
        sys.exit(1)
    config_path = sys.argv[1]
    base_path = sys.argv[2]
    force_flag = sys.argv[3].lower() == "true"

    try:
        config = load_config(config_path)

        # Create symlinks
        create_symlinks(config, base_path, force_flag)

        print(output(""))

        # Install pacakges and additional configurations
        install_git_completion(config, force_flag)

    except KeyboardInterrupt:
        print(output("Installation interrupted by user. Cleaning up..."))
        sys.exit(1)
