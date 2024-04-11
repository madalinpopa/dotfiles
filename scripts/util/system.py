import os
import platform
import subprocess
import shutil

from util.display import display


def shell_command(
    command,
    cwd=None,
    enable_stdin=False,
    enable_stdout=False,
    enable_stderr=False,
) -> subprocess.CompletedProcess:
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


def ask_for_sudo() -> bool:
    """Ask for sudo password"""
    result = subprocess.run(
        ["/usr/bin/sudo", "/usr/bin/id"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    return result.returncode == 0


def get_os() -> str:
    system = platform.system().lower()

    if system == "darwin":
        return system.capitalize()
    elif system == "linux":
        os_release = platform.freedesktop_os_release()
        os_id = os_release.get("ID")
        if os_id and os_id in ["ubuntu", "debian"]:
            return "debian-based"
    return ""


def locate_apt_package(package: str) -> bool:
    cmd = f"apt-cache show {package}"
    process = shell_command(cmd)
    if process.returncode > 0:
        message = f"Unable to locate package {package}"
        display(message=message, output_type="FAIL")
        return False
    return True


def update_apt_cache() -> None:
    display("Run apt update cache..")
    cmd = "sudo apt update"
    process = shell_command(cmd)
    if process.returncode > 0:
        display("Fail to update apt cache", output_type="FAIL")
        print(process.returncode)


def install_apt_package(package: str):
    cmd = f"sudo apt install -y {package}"
    # check if package is already in path
    if not shutil.which(package):
        message = f"Install package '{package}'"
        process = shell_command(cmd)
        if process.returncode > 0:
            message = f"Fail to install package {package}"
            display(message=message, output_type="FAIL")
            print(process.returncode)
        else:
            message = f"Package '{package}' was installed"
            display(message=message, output_type="OK")
    else:
        message = f"Package '{package}' is already installed"
        display(message=message, output_type="OK")


def delete_path(path: str) -> None:
    if os.path.isfile(path) or os.path.islink(path):
        os.remove(path)
    elif os.path.isdir(path):
        shutil.rmtree(path)
