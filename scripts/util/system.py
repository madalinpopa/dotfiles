import os
import platform
import subprocess
import shutil


def shell_command(
    command,
    cwd=None,
    enable_stdin=False,
    enable_stdout=False,
    enable_stderr=False,
):
    with open(os.devnull, "w") as devnull_w, open(os.devnull, "r") as devnull_r:
        stdin = None if enable_stdin else devnull_r
        stdout = None if enable_stdout else devnull_w
        stderr = None if enable_stderr else devnull_w
        executable = os.environ.get("SHELL")
        return subprocess.run(
            command,
            shell=True,
            executable=executable,
            stdin=stdin,
            stdout=stdout,
            stderr=stderr,
            cwd=cwd,
        )


def get_os() -> str:
    system = platform.system()
    if system.lower() == "darwin":
        return system
    if system.lower() == "linux":
        os_release = platform.freedesktop_os_release()
        os_id = os_release.get("ID")
        if os_id and os_id == "ubuntu":
            return "ubuntu"
    return ""


def delete_path(path: str) -> None:
    if os.path.isfile(path) or os.path.islink(path):
        os.remove(path)
    elif os.path.isdir(path):
        shutil.rmtree(path)
