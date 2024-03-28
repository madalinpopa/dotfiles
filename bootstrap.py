import os

import tomllib


def makedirs(directory_path: str):
    """
    Create a directory and any necessary parent directories.

    Args:
        directory_path (str): The path of the directory to be created.
    """
    if not os.path.exists(directory_path):
        os.makedirs(directory_path)


def symlink(source: str, destination: str):
    """
    Create a symbolic link from the source path to the destination path.

    Args:
        source (str): The path of the source file or directory.
        destination (str): The path where the symbolic link will be created.
    """
    # Add your implementation here
    os.symlink(source, destination)


def main():
    """
    The main function of the script.
    """
    with open("config.toml", "rb") as f:
        data = tomllib.load(f)

    print(data)


if __name__ == "__main__":
    main()
