import tkinter as tk

class LoadingWindow(tk.Tk):
    def __init__(self):
        tk.Tk.__init__(self)
        self.title("Loading")
        self.geometry("200x100")
        self.resizable(0, 0)
        self.wm_attributes("-topmost", 1)
        self.label = tk.Label(self, text="Loading...")
        self.label.pack(pady=10)
    
    def update_text(self, text):
        self.label.configure(text=text)
        self.update()
