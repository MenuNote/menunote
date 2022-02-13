import getpass

user_name = getpass.getuser()

class Note:
    def get_note():
        return open(f"/users/{user_name}/Library/Application Support/BarNotes/note.txt").read()

    def set_note(note):
        if note == "":
            note = "Bar Notes"
        note = note[:100]
        with open(f"/users/{user_name}/Library/Application Support/BarNotes/note.txt", "w") as f:
            f.write(note)
