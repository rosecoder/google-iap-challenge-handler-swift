import Foundation
import AppKit
import WebKit

final public class ChallengeHandler: NSObject, WKNavigationDelegate, WKUIDelegate {

    public enum Error: Swift.Error {
        case cancelled
    }

    public typealias Completion = (Result<Void, Error>) -> Void

    let url: URL
    let completion: Completion

    public init(url: URL, completion: @escaping Completion) {
        self.url = url
        self.completion = completion

        super.init()
    }

    // MARK: - Handle

    public typealias View = NSWindow

    private var window: NSWindow?

    public func handle(fromView parentView: View) {
        precondition(Thread.isMainThread)

        let webView = WKWebView()
        // TODO: Configure with separate process pool
        webView.navigationDelegate = self
        webView.uiDelegate = self

        // TODO: Use current versions in user agent
        webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Safari/605.1.15"

        let viewController = WebViewController(webView: webView, completion: completion)

        let window = NSWindow(contentViewController: viewController)
        window.setContentSize(NSSize(width: 800, height: 800))
        self.window = window

        parentView.beginSheet(window) { response in
            switch response {
            case .cancel:
                self.completion(.failure(.cancelled))
            default:
                break
            }
        }

        webView.load(URLRequest(url: url))
    }

    // MARK: - WKNavigationDelegate

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // TODO: Make sure cookies are persisted

        if webView.url?.host == url.host {
            completion(.success(()))
            window?.close()
        }
    }
}
