#!/usr/bin/env python3

import os
import sys

from util.common import wget
from util.config import load_config
from util.display import output, progress
from util.symlinks import create_symlinks


def install_git_completion(config: dict[str, str], force_flag: bool) -> None:
    """
    Install git completion script from the given configuration.

    Args:
        config (dict): The configuration containing the external scripts.
        force_flag (bool): Flag indicating whether to force installation even if the file already exists.
    """
    for script in config.get("completion_scripts", []):
        url = script["url"]
        target = os.path.expanduser(script["target"])
        message = output(f"Downloaded {target}", output_type="OK")

        file_exists: bool = os.path.exists(target)

        if (force_flag and file_exists) or not file_exists:
            wget(url=url, file_path=target)
            print(message)
        else:
            message = output(f"File {target} already present")
            print(message)


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
        with progress():
            create_symlinks(config, base_path, force_flag)

        print(output(""))

        # Install packages and additional configurations
        with progress():
            install_git_completion(config, force_flag)

    except KeyboardInterrupt:
        print(output("Installation interrupted by user. Cleaning up..."))
        sys.exit(1)
