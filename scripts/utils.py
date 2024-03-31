import json
import os
import shutil
import sys
import urllib.request
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


def delete_path(path: str) -> None:
    if os.path.isfile(path) or os.path.islink(path):
        os.remove(path)
    elif os.path.isdir(path):
        shutil.rmtree(path)


def ensure_dirs(path: str) -> None:
    """Ensures the directory for given path exists."""
    os.makedirs(os.path.dirname(path), exist_ok=True)


def wget(url: str, file_path: str) -> None:
    """
    Downloads a file from the specified URL and saves it to the specified file path.
    """
    urllib.request.urlretrieve(url, file_path)
