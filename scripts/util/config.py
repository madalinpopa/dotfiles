import sys
import json
from util.display import output


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
