import AppKit
import WebKit

final class WebViewController: NSViewController {

    let completion: ChallengeHandler.Completion

    init(webView: WKWebView, completion: @escaping ChallengeHandler.Completion) {
        self.webView = webView
        self.completion = completion

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Life Cycle

    override func loadView() {
        view = NSView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)

        cancelButton.target = self
        cancelButton.action = #selector(performCancel)
        view.addSubview(cancelButton)
    }

    // MARK: - Views

    private let webView: WKWebView

    private let cancelButton = NSButton(title: NSLocalizedString("handler.button.cancel", comment: ""), target: nil, action: nil)

    // MARK: - Layout

    override func viewDidLayout() {
        super.viewDidLayout()

        let cancelButtonSize = cancelButton.sizeThatFits(view.bounds.size)
        cancelButton.frame = CGRect(
            x: view.bounds.width - cancelButtonSize.width - 16,
            y: 16,
            width: cancelButtonSize.width,
            height: cancelButtonSize.height
        )

        let webViewSize = CGSize(width: view.bounds.width, height: view.bounds.height - cancelButton.frame.height - 16 * 2)
        webView.frame = CGRect(
            x: 0,
            y: view.bounds.height - webViewSize.height,
            width: webViewSize.width,
            height: webViewSize.height
        )
    }

    // MARK: - Actions

    @objc
    private func performCancel(_ sender: Any?) {
        completion(.failure(.cancelled))
        view.window?.close()
    }
}
