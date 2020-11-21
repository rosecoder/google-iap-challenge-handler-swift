import AppKit
import GoogleIAPChallengeHandler

@objc(AppDelegate)
final class AppDelegate: NSObject, NSApplicationDelegate {

    private(set) var mainWindow: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Foundation.Notification) {
        let contentView = NSView(frame: .zero)

        let button = NSButton(title: "Perform Request", target: self, action: #selector(performRequest))
        button.sizeToFit()
        button.frame.origin = NSPoint(x: 16, y: 16)
        contentView.addSubview(button)

        contentView.frame.size = NSSize(width: button.frame.width + 16 * 2, height: button.frame.height + 16 * 2)

        mainWindow = NSWindow(
            contentRect: contentView.bounds,
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        mainWindow.title = "Google IAP Challenge Handler Demo"
        mainWindow.minSize = contentView.frame.size
        mainWindow.isReleasedWhenClosed = false
        mainWindow.center()
        mainWindow.setFrameAutosaveName("Main Window")
        mainWindow.contentView = contentView
        mainWindow.makeKeyAndOrderFront(nil)
    }

    // MARK: - Actions

    @objc
    private func performRequest() {
        let url = URL(string: "")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, connectionError) in
            if let connectionError = connectionError {
                print("Connection error: \(connectionError)")
                return
            }

            if let response = response {
                response.handleGoogleIAPChallengeIfNeeded(fromView: self.mainWindow, originalURL: url) { result in
                    switch result {
                    case .failure(let error):
                        print("Error: \(error)")
                    case .success:
                        print("Success!")
                    }
                }
            }
        }
        task.resume()
    }
}
