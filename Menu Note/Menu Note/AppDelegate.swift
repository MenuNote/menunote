import SwiftUI
import Foundation

class AppDelegate: NSObject, NSApplicationDelegate {
    var files = Files()
    var statusItem: NSStatusItem?
    var popOver = NSPopover()
    var noteInstance: Note = Note()
    var version = "1.0.4"
    
    var updateTitleTimer = Timer()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.accessory)
        files.createFiles()
        
        let menuView = MenuView()
        
        popOver.behavior = .transient
        popOver.animates = true
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let MenuButton = statusItem?.button {
            MenuButton.action = #selector(openMenu)
            MenuButton.title = noteInstance.getNote()
        }
        
        updateTitleTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTitle), userInfo: nil, repeats: true)
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        NSApp.setActivationPolicy(.accessory)
        return false
    }
    
    func quitApp() {
        exit(0)
    }
    
    func getVersion() -> String {
        return version
    }
    
    @objc func updateTitle() {
        statusItem?.button?.title = Note().getNote()
    }
    
    @objc func openMenu() {
        if let menuButton = statusItem?.button {
            self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
        }
    }
    
    @objc func openAboutWindow() {
        NSApp.setActivationPolicy(.regular)
    }
}
