import Cocoa
import WebKit

// Window dimensions constants
private let WINDOW_WIDTH: CGFloat = 1024
private let WINDOW_HEIGHT: CGFloat = 768

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var webView: WKWebView!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let windowRect = NSRect(x: 0, y: 0, width: WINDOW_WIDTH, height: WINDOW_HEIGHT)

        window = NSWindow(
            contentRect: windowRect,
            styleMask: [.titled, .closable, .miniaturizable],
            backing: .buffered,
            defer: false
        )

        window.title = "Meatz"
        window.center()

        webView = WKWebView(frame: windowRect)
        window.contentView = webView

        if let url = URL(string: "http://localhost:3000") {
            webView.load(URLRequest(url: url))
        }

        window.makeKeyAndOrderFront(nil)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

let app = NSApplication.shared
app.setActivationPolicy(.regular)
let delegate = AppDelegate()
app.delegate = delegate
app.activate(ignoringOtherApps: true)
app.run()
