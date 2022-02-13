import rumps
import sys
import threading

from utils.logger import Logger
from utils.note import Note
from utils.resourcePath import resource_path

class BarNotes(rumps.App):
    def __init__(self):
        super(BarNotes, self).__init__("BarNotes", title="  " + Note.get_note(), icon="data/icon.png", quit_button=None)
        
        self.logger = Logger()
        self.logger.log("BarNotes initialized")

        self.menu = ["Edit Note", "Quit"]

    @rumps.clicked("Edit Note")
    def edit(self, _):
        window = rumps.Window(title="Edit your note", message="The max amount of characters is 100.", dimensions=(300, 85), ok="Save", cancel="Cancel")
        window.default_text = Note.get_note()
        window.icon = "data/icon.png"

        self.logger.log("Edit Note window opened")

        response = window.run()
        if response.clicked == 1:
            self.logger.log(f"Set note to {response.text}")
            Note.set_note(response.text)
            self.title = "  " + Note.get_note()
        elif response.clicked == 0:
            self.logger.log("Note was not changed")

    @rumps.clicked("Quit")
    def close(self, _):
        self.logger.log("BarNotes quit")
        self.logger.close()
        rumps.quit_application()

    def start(self):
        self.logger.log("BarNotes running")
        self.run()

if __name__ == "__main__":
    app = BarNotes()
    app.start()