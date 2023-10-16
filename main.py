#!/usr/bin/env python3

import os
import logging
import subprocess
from pathlib import Path
import venv

logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
logger = logging.getLogger()

BASE_DIR = Path(__file__).parent

PYTHON = ".venv/bin/python"


class ExtendedEnvBuilder(venv.EnvBuilder):
    """
    This builder installs setuptools and pip so that you can pip or
    easy_install other packages into the created virtual environment.
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def post_setup(self, context):
        """
        Set up any packages which need to be pre-installed into the
        virtual environment being created.
        """
        os.environ["VIRTUAL_ENV"] = context.env_dir
        self.install_requirements()
        self.run_dotbot()

    def install_requirements(self):
        """Install requirements.txt"""
        logger.info("Install python requirements")
        subprocess.run(["pip", "install", "-r", "requirements.txt"])

    def run_dotbot(self):
        """Run dotbot to create links"""
        logger.info("Run dotbot")
        subprocess.run(["dotbot", "-c", "install.conf.yaml"])


if __name__ == "__main__":
    logger.info("Create virtual environment `.venv`")
    venv = ExtendedEnvBuilder(with_pip=True, clear=True)
    venv.create(".venv")
