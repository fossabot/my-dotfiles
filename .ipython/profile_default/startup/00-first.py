"""$PYTHONSTARTUP."""
import sys
import logging
from rich import print
from rich.logging import RichHandler

logging.basicConfig(
    format="%(message)s",
    handlers=[RichHandler(rich_tracebacks=True, markup=True)],
)
# cannot work in ptpython
if sys.argv[0] == "":
    from rich import pretty
    from rich import traceback

    pretty.install()
    traceback.install()

    import os
    import platform
    from getpass import getuser
    from datetime import datetime
    import colorama
    from colorama import Fore, Back, Style

    class _Ps1:
        def __init__(self):
            self.n = 0
            if sys.platform == "windows":
                colorama.init()

            try:
                # python 3.10 support platform.freedesktop_os_release()
                os_name = platform.freedesktop_os_release().get("ID", "")  # type: ignore
            except AttributeError:
                os_name = ""
            except OSError:
                if os.getenv("PREFIX") == "/data/data/com.termux/files/usr":
                    os_name = "android"
                else:
                    os_name = sys.platform

            icons = {
                "linux": "",
                "linux2": "",
                "linux3": "",
                "hurd": "",
                "darwin": "",
                "dos": "",
                "win16": "",
                "win32": "",
                "cygwin": "",
                "java": "",
                "android": "",
                "arch": "",
                "gentoo": "",
                "ubuntu": "",
                "cent": "",
                "debian": "",
                "dock": "",
            }
            self.os_icon = icons.get(os_name, "?")

        def __str__(self):
            self.n += 1
            path = os.getcwd()
            if os.access(path, 7):
                path = " " + path
            else:
                path = " " + path

            return (
                Fore.WHITE
                + Back.BLUE
                + datetime.now().strftime("%F%T%a")
                + Fore.BLUE
                + Back.RED
                + ""
                + Fore.BLACK
                + Back.RED
                + getuser()
                + Fore.RED
                + Back.MAGENTA
                + ""
                + Fore.BLACK
                + self.os_icon
                + Fore.MAGENTA
                + Back.YELLOW
                + ""
                + Fore.BLACK
                + path
                + Fore.YELLOW
                + Back.BLACK
                + ""
                + Style.RESET_ALL
                + "\n"
                + f"{self.n:2} "
            )

    sys.ps1 = _Ps1()
    sys.ps2 = "--> "
