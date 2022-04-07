//
//  Changelog.swift
//  Menu Note
//
//  Created by Ben Tettmar on 06/04/2022.
//

import SwiftUI

struct ChangelogView: View {
    @Environment(\.openURL) var openURL
    @State private var appDelegate = AppDelegate()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Changelog")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding([.horizontal, .top])
                    .font(.system(size: 18))
                
                Text("Version \(appDelegate.getVersion())")
                    .padding([.horizontal])
                    .font(.system(size: 12))
                
                List {
                    Text("• Rewritten with Swift for native Mac OS support.")
                    Text("• Edit notes right in the menu bar view.")
                    Text("• Changelog window, about window.")
                }
                .frame(width: 350, height: 100)
            }
        }
    }
}

struct ChangelogView_Previews: PreviewProvider {
    static var previews: some View {
        ChangelogView()
    }
}
