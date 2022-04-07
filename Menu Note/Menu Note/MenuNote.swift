import SwiftUI
import Foundation

@main
struct MenuNote: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            AboutView()
        }
        
        WindowGroup("Menu Note") {
            ChangelogView().handlesExternalEvents(preferring: Set(arrayLiteral: "changelogview"), allowing: Set(arrayLiteral: "*"))
        }
        .handlesExternalEvents(matching: Set(arrayLiteral: "changelogview"))
        
        WindowGroup("Menu Note") {
            AboutView().handlesExternalEvents(preferring: Set(arrayLiteral: "aboutview"), allowing: Set(arrayLiteral: "*"))
        }
        .handlesExternalEvents(matching: Set(arrayLiteral: "aboutview"))
    }
}
