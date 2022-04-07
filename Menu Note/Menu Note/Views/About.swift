import SwiftUI

struct AboutView: View {
    @Environment(\.openURL) var openURL
    @State private var appDelegate = AppDelegate()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Menu Note")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding([.horizontal, .top])
                    .font(.system(size: 18))
                
                Text("Version \(appDelegate.getVersion())")
                    .padding([.horizontal])
                    .font(.system(size: 12))
                
                Text("Quick note taking in your menu bar")
                    .padding([.horizontal, .top])
                
                Text("Created by Ben Tettmar")
                    .padding([.horizontal])
                
                Divider()
                    .padding(.vertical, 10.0)
                    .frame(width: 350.0)
                
                HStack {
                    Button(action: {openURL(URL(string: "menunote://changelogview")!)}) {
                        Text("Changelog")
                    }
                    Button(action: {openURL(URL(string: "https://menunote.app/")!)}) {
                        Text("Website")
                    }
                    Button(action: {openURL(URL(string: "https://github.com/MenuNote")!)}) {
                        Text("Github")
                    }
                }
                .padding([.leading, .bottom, .trailing])
            }
            
//            Image("appicon")
//                .resizable()
//                .frame(width: 100, height: 100)
//                .padding(.bottom, 65)
//                .padding(.trailing, 10)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
