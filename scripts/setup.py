#!/usr/bin/env python3
import os
import subprocess
import sys
from shutil import which, rmtree
import time
from utils import display, load_config, wget, progress
from tempfile import mkdtemp


def ask_for_sudo() -> bool:
    """Ask for sudo password"""
    result = subprocess.run(
        ["/usr/bin/sudo", "/usr/bin/id"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    return result.returncode == 0


def setup_env_variables() -> None:
    """Add environment variables needed for setup script"""
    # needed for homebrew
    os.environ["NONINTERACTIVE"] = "1"


def check_prerequisites() -> None:
    """Check if prerequisites tools are installed"""
    if not which("git"):
        display("Git is required for setup script.")
        display("Please install git and start again...")
        sys.exit(1)


def run_bash_script(script_path: str) -> bool:
    """Runs a bash script and return True or False if succeded or fails"""
    result = subprocess.run(
        ["/bin/bash", script_path],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    return result.returncode == 0


def install_external_scripts(config: dict):
    """Install tools through external scripts defined in config.json"""
    applications = config["external_scripts"]
    temp_directory = mkdtemp()
    for app in applications:
        # first check if program is not installed
        if not which(app["executable"]):
            url = app["url"]
            name = app["name"]
            script = os.path.join(temp_directory, f"{name}.sh")
            wget(file_path=script, url=url)
            display(message=f"Installing {name}")
            with progress():
                run_bash_script(script_path=script)
                display(f"{name} was installed successfully", output_type="OK")
        else:
            display(f"{app['name']} is already installed")
    rmtree(temp_directory)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 setup.py <config_path> <base_path>")
        sys.exit(1)
    config_path = sys.argv[1]
    base_path = sys.argv[2]

    try:
        config = load_config(config_path)

        # Check if required tools are installed
        check_prerequisites()

        # Set needed environment variables
        setup_env_variables()

        is_sudo = ask_for_sudo()
        if not is_sudo:
            display("Sudo privileges are required to continue the setup")
            sys.exit(1)
        else:
            install_external_scripts(config=config)

    except KeyboardInterrupt:
        sys.exit(1)
