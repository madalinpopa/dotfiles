import sys
import json
from pathlib import Path
from util.display import output



def _handle_error(message: str) -> None:
    """Helper function to handle errors"""
    print(output(message, output_type="FAIL"))
    sys.exit(1)

def load_config(file_path="config.json") -> dict[str]:
    """Loads the configuration from a JSON file."""
    file_path = Path(file_path)

    if not file_path.exists():
        _handle_error("Config file not found. Please ensure config.json exists.")

    try:
        with open(file_path, "r") as config_file:
            message = "Configuration file was found and loaded"
            print(output(message, output_type="OK"))
            return json.load(config_file)
    except json.JSONDecodeError:
        message = "Error parsing the config.json file"
        _handle_error(message)
    except Exception as e:
        _handle_error(f"Unexpected error reading config file: {str(e)}")
