#!/usr/bin/env python3
import os
import subprocess
import sys
from shutil import rmtree, which
from tempfile import mkdtemp

from util.common import wget
from util.config import load_config
from util.display import display, progress
from util.system import (
    ask_for_sudo,
    get_os,
    install_apt_package,
    locate_apt_package,
    update_apt_cache,
)


def setup_env_variables() -> None:
    """Add environment variables needed for setup script"""
    # needed for homebrew
    os.environ["NONINTERACTIVE"] = "1"


def install_config_packages(config: dict) -> None:
    """Run apt-get on Ubuntu to install build-essential"""
    packages = config["apt_packages"]
    if get_os() == "debian-based":
        display("")
        with progress():
            update_apt_cache()
        for package in packages:
            if locate_apt_package(package):
                with progress():
                    install_apt_package(package)


def install_external_scripts(config: dict) -> None:
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
                command = ["/bin/bash", script]
                process = subprocess.run(
                    command,
                    stderr=subprocess.DEVNULL,
                    stdout=subprocess.DEVNULL,
                )
                if process.returncode == 0:
                    message = f"{name} was installed successfully"
                    display(message, output_type="OK")
                else:
                    message = f"{name} could not be installed"
                    display(message, output_type="FAIL")
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

        # Set needed environment variables
        setup_env_variables()

        is_sudo = ask_for_sudo()
        if not is_sudo:
            display("Sudo privileges are required to continue the setup")
            sys.exit(1)
        else:
            install_config_packages(config=config)
            display("")
            install_external_scripts(config=config)
            display("")

    except KeyboardInterrupt:
        sys.exit(1)
