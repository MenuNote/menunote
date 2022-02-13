import getpass

user_name = getpass.getuser()

class Note:
    def get_note():
        return open(f"/users/{user_name}/Library/Application Support/MenuNote/note.txt").read()

    def set_note(note):
        if note == "":
            note = "Menu Note"
        note = note[:100]
        with open(f"/users/{user_name}/Library/Application Support/MenuNote/note.txt", "w") as f:
            f.write(note)
