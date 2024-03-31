#!/bin/env python3
import os
import urllib.request


def wget(url: str, file_path: str) -> None:
    # Check if the file exists
    if not os.path.isfile(file_path):

        # If not, download the file
        urllib.request.urlretrieve(url, file_path)


def setup_git_completion_bash() -> None:
    file_path = os.path.expanduser("~/.git-completion.bash")
    url = "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash"

    # Check if the file exists
    if not os.path.isfile(file_path):

        # If not, download the file
        urllib.request.urlretrieve(url, file_path)


def main() -> None:
    setup_git_completion_bash()


if __name__ == "__main__":
    main()
