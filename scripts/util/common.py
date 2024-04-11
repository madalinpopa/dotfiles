import urllib.request


def wget(url: str, file_path: str) -> None:
    """
    Downloads a file from the specified URL and saves it to the specified file path.
    """
    urllib.request.urlretrieve(url, file_path)
