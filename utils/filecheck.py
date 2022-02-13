import os
import requests

from windows.loading import LoadingWindow

def check_files():
    loadingwindow = LoadingWindow()

    files = [
        "https://raw.githubusercontent.com/bentettmar/barnotes/main/data/icon.png",
        "https://raw.githubusercontent.com/bentettmar/barnotes/main/data/note.txt"
    ]

    loadingwindow.update_text("Checking files...")
    if not os.path.exists(os.path.expanduser("~/Library/Application Support/BarNotes")):
        os.makedirs(os.path.expanduser("~/Library/Application Support/BarNotes"))
        loadingwindow.update_text("Creating directory...")

    loadingwindow.update_text("Downloading files...")
    for file in files:
        if not os.path.exists(os.path.expanduser(f"~/Library/Application Support/BarNotes/{file.split('/')[-1]}")):
            loadingwindow.update_text(f"Downloading {file.split('/')[-1]}...")
            r = requests.get(file)
            with open(os.path.expanduser(f"~/Library/Application Support/BarNotes/{file.split('/')[-1]}"), "wb") as f:
                f.write(r.content)
            loadingwindow.update_text(f"Downloaded {file.split('/')[-1]}...")
    
    loadingwindow.update_text("Done!")
    loadingwindow.destroy()
