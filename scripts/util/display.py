import itertools
import sys
import threading
import time
from contextlib import contextmanager
from textwrap import indent
from typing import Generator

OUTPUT_TYPES = {
    "INFO": ("\033[94m", ".."),
    "WARNING": ("\033[93m", "WARNING"),
    "FAIL": ("\033[91m", "FAIL"),
    "OK": ("\033[00;32m", "OK"),
}


def output(message: str, output_type: str = "INFO") -> str:
    """Format message to standard output"""

    # Get color code and prefix, or raise error if invalid output_type
    if output_type not in OUTPUT_TYPES:
        raise ValueError(f"Invalid output type: {output_type}")
    color, prefix = OUTPUT_TYPES[output_type]

    # Reset color code
    reset_code = "\033[0m"

    # Format and print the message
    formatted_message = f"[{color} {prefix} {reset_code}] {message}"
    return indent(f"{formatted_message}", "  ")


def display(message: str, output_type: str = "INFO") -> None:
    """Prints a message to standard console"""
    message = output(message=message, output_type=output_type)
    print(message)


def display_loader(event):
    """Displays a loader."""
    for c in itertools.cycle(["|", "/", "-", "\\"]):
        if event.is_set():
            break
        print(output(c), end="\r", flush=True)
        time.sleep(0.1)
    sys.stdout.flush()


@contextmanager
def progress() -> Generator:
    event = threading.Event()
    loader = threading.Thread(target=display_loader, args=(event,))
    loader.start()
    try:
        yield
    finally:
        event.set()
        loader.join()
