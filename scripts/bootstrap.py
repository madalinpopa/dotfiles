import json
import os
import shutil
import sys
from textwrap import indent


def output(message: str, output_type: str = "INFO") -> str:
    """Print message to standard output"""
    output_types = {
        "INFO": ("\033[94m", ".."),
        "WARNING": ("\033[93m", "WARNING"),
        "FAIL": ("\033[91m", "FAIL"),
        "OK": ("\033[00;32m", "OK"),
    }

    # Get color code and prefix, or raise error if invalid output_type
    if output_type not in output_types:
        raise ValueError(f"Invalid output type: {output_type}")
    color, prefix = output_types[output_type]

    # Reset color code
    reset_code = "\033[0m"

    # Format and print the message
    formatted_message = f"[{color} {prefix} {reset_code}] {message}"
    return indent(f"{formatted_message}", "  ")


def load_config(file_path="config.json") -> dict[str]:
    """Loads the configuration from a JSON file."""
    try:
        with open(file_path, "r") as config_file:
            message = "Configuration file was found and loaded"
            print(output(message, output_type="OK"))
            return json.load(config_file)
    except FileNotFoundError:
        message = "Config file not found. Please ensure config.json exists."
        print(output(message, output_type="FAIL"))
        sys.exit(1)
    except json.JSONDecodeError:
        message = "Error parsing the config.json file"
        print(output(message, output_type="FAIL"))
        sys.exit(1)


def delete_target(target: str) -> None:
    if os.path.isfile(target) or os.path.islink(target):
        os.remove(target)
    elif os.path.isdir(target):
        shutil.rmtree(target)


def handle_existing_target(target: str, force: bool) -> bool:
    """Validate if source file exists and is not symlink"""
    if os.path.exists(target):
        if force:
            delete_target(target)
            print(output(f"Deleted {target} (force applied)."))
        else:
            prompt = f"File {target} exists and is not a symlink. Delete? (y/N): "
            response = input(output(prompt, output_type="WARNING"))
            if response.lower() == "y":
                delete_target(target)
                print(output(f"Deleted {target}."))
            else:
                print(output(f"Skipping {target}."))
                return False
    else:
        message = f"Remove old symlink for {target}"
        print(output(message, output_type="OK"))
        delete_target(target)
    return True


def ensure_target_directory_exists(target: str):
    """Ensures the directory for the target path exists."""
    os.makedirs(os.path.dirname(target), exist_ok=True)


def create_symlink(source: str, target: str) -> None:
    """Attempts to create a symlink and handles potential errors"""
    try:
        os.symlink(source, target)
        text = output(f"Created symlink: {source} -> {target}", output_type="OK")
        print(text)
    except OSError as e:
        message = f"Failed to create symlink for {source} -> {target}: {e}"
        print(output(message, output_type="FAIL"))


def process_config(config: dict, base_path: str, force: bool) -> None:
    """Creates symlinks based on the loaded configuration."""
    for dotfile in config.get("dotfiles", []):
        source = os.path.join(base_path, dotfile["source"])
        target = os.path.expanduser(dotfile["target"])

        if not os.path.exists(source):
            print(f"Source file {source} not found. Skipping...")
            continue

        if not handle_existing_target(target, force):
            # Skip this file if the user chooses not to delete
            # the existing non-symlink file
            continue

        ensure_target_directory_exists(target)

        create_symlink(source, target)


if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: python3 bootstrap.py <config_path> <base_path> <force_flag>")
        sys.exit(1)
    config_path = sys.argv[1]
    base_path = sys.argv[2]
    force_flag = sys.argv[3].lower() == "true"

    try:
        config = load_config(config_path)
        process_config(config, base_path, force_flag)
    except KeyboardInterrupt:
        print(output("Installation interrupted by user. Cleaning up..."))
        sys.exit(1)
