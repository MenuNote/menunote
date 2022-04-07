import SwiftUI
import AppKit

struct MenuView: View {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.openURL) var openURL
    
    @State private var noteInstance: Note = Note()
    @State private var noteText: String = Note().getNote()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Edit Note")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding([.horizontal, .top])
                .font(.system(size: 18))
            
            HStack {
                TextField("Note..", text: $noteText)
                
                Button(action: {Note().editNote(text: noteText)}) {
                    Text("Save")
                }
            }
            .padding([.horizontal])
            
            Divider()
                .padding(.vertical, 10.0)
                .frame(width: 250.0)
            
            HStack {
                Button(action: appDelegate.openAboutWindow) {
                    Text("About")
                }
                Button(action: appDelegate.quitApp) {
                    Text("Quit")
                }
            }
            .padding([.leading, .bottom, .trailing])
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
