import datetime
import colorama

from .loggertype import LoggerType

class Logger:
    def __init__(self):
        pass

    def log(self, message, type=LoggerType.INFO):
        time = datetime.datetime.now().strftime("%H:%M:%S")
        msg = f"[{time}] [{type}] {message}"

        if type == LoggerType.INFO:
            print(colorama.Fore.BLUE + msg + colorama.Style.RESET_ALL)
        elif type == LoggerType.ERROR:
            print(colorama.Fore.RED + msg + colorama.Fore.RESET_ALL)
        elif type == LoggerType.WARNING:
            print(colorama.Fore.YELLOW + msg + colorama.Fore.RESET_ALL)
        elif type == LoggerType.SUCCESS:
            print(colorama.Fore.GREEN + msg + colorama.Fore.RESET_ALL)