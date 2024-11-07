import os

from util.system import delete_path, get_os
from util.display import output


def handle_existing_target(target: str, force: bool) -> bool:
    """Validate if source file exists and is not symlink"""
    if os.path.exists(target):
        if force:
            delete_path(target)
            print(output(f"Deleted {target} (force applied)."))
        else:
            prompt = f"File {target} exists and is not a symlink. Delete? (y/N): "
            response = input(output(prompt, output_type="WARNING"))
            if response.lower() == "y":
                delete_path(target)
                print(output(f"Deleted {target}."))
            else:
                print(output(f"Skipping {target}."))
                return False
    else:
        message = f"Remove old symlink for {target}"
        print(output(message, output_type="OK"))
        delete_path(target)
    return True


def handle_symlink_creation(source: str, target: str) -> None:
    """Attempts to create a symlink and handles potential errors"""
    try:
        os.symlink(source, target)
        text = output(f"Created symlink: {source} -> {target}", output_type="OK")
        print(text)
    except OSError as e:
        message = f"Failed to create symlink for {source} -> {target}: {e}"
        print(output(message, output_type="FAIL"))


def create_symlinks(config: dict, base_path: str, force: bool) -> None:
    """Creates symlinks based on the loaded configuration."""
    current_os = get_os().lower()

    for dotfile in config.get("dotfiles", []):
        source = os.path.join(base_path, dotfile["source"])
        target = os.path.expanduser(dotfile["target"])
        system = dotfile["system"].lower()

        if not os.path.exists(source):
            print(f"Source file {source} not found. Skipping...")
            continue

        # Check if this dotfile should be installed on this system
        should_install = (
            system == "all" or  # Install if specified for all systems
            system == current_os  # Install if matches current OS
        )

        if not should_install:
            message = f"Skipping {source} - not configured for {current_os}"
            print(output(message, output_type="INFO"))
            continue

        if not handle_existing_target(target, force):
            # Skip this file if the user chooses not to delete
            # the existing non-symlink file
            continue

        os.makedirs(os.path.dirname(target), exist_ok=True)

        handle_symlink_creation(source, target)
