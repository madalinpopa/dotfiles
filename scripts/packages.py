import os

from utils import output, wget


def install_git_completion(config: dict[str], force_flag: bool) -> None:
    """
    Install git completion script from the given configuration.

    Args:
        config (dict): The configuration containing the external scripts.
        force_flag (bool): Flag indicating whether to force installation even if the file already exists.
    """
    for script in config.get("external_scripts", []):
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


def install_homebrew(config: dict[str]) -> None:
    pass
