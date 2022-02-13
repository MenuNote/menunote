from .resourcePath import resource_path

class Note:
    def get_note():
        return open("data/note.txt").read()

    def set_note(note):
        if note == "":
            note = "default note"
        note = note[:100]
        with open("data/note.txt", "w") as f:
            f.write(note)