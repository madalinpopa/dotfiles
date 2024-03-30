import os
from textwrap import indent
import sys
import json

def output(message: str, output_type: str = "INFO") -> str:
    """Print message to standard output"""
    output_types = {
        "INFO": ("\033[94m", ".."),
        "WARNING": ("\033[93m", "WARNING"),
        "FAIL": ("\033[91m", "FAIL"),
        "OK": ("\033[00;32m", "OK")
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


def load_config(file_path='config.json') -> dict[str]:
    """Loads the configuration from a JSON file."""
    try:
        with open(file_path, 'r') as config_file:
            message = "Configuration file was found and loaded"
            print(output(message, output_type="OK"))
            return json.load(config_file)
    except FileNotFoundError:
        message = "Config file not found. Please ensure config.json exists."
        print(output(message, output_type="FAIL"))
        sys.exit(1)
    except json.JSONDecodeError:
        message= "Error parsing the config.json file"
        print(output(message, output_type="FAIL"))
        sys.exit(1)


def create_symlinks(config: dict, base_path: str) -> None:
    """Creates symlinks based on the loaded configuration."""
    for dotfile in config.get('dotfiles', []):
        source = os.path.join(base_path, dotfile['source'])
        target = os.path.expanduser(dotfile['target'])

        # Ensure the source file exists
        if os.path.exists(source) and not os.path.islink(target):
            prompt = f"File {target} exists and is not a symlink. Delete? (y/N): "
            response = input(output(prompt, output_type="WARNING"))
            if response.lower() == 'y':
                os.remove(target)
                print(output(f"Deleted {target}."))
            else:
                print(output(f"Skipping {target}."))
                continue
        else:
            message = f"Source file {source} not found. Skipping..."
            print(output(message, output_type="WARNING"))
            continue

        # Check if target exists and is not a symlink
        if os.path.exists(target) and not os.path.islink(target):
            message = f"Skipping {target}: File exists and is not a symlink."
            print(output(message, output_type="WARNING"))
            continue

        # Ensure the target directory exists
        os.makedirs(os.path.dirname(target), exist_ok=True)

        # Remove the target if it already exists (e.g., as an old symlink)
        try:
            if os.path.lexists(target):
                message = f"Remove old symlink for {target}"
                print(output(message, output_type="OK"))
                os.remove(target)
            os.symlink(source, target)
            text = output(f"Created symlink: {source} -> {target}", output_type="OK")
            print(text)
        except OSError as e:
            message = f"Failed to create symlink for {source} -> {target}: {e}"
            print(output(message, output_type="FAIL"))


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 bootstrap.py <config_path> <base_path>")
        sys.exit(1)
    config_path = sys.argv[1]
    base_path = sys.argv[2]
    config = load_config(config_path)
    create_symlinks(config, base_path)
