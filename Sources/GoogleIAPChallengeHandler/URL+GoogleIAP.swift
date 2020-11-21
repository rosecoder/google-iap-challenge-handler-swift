import Foundation

extension URLResponse {

    public var isGoogleIAPChallenge: Bool {
        url?.host?.lowercased() == "accounts.google.com" &&
        url?.path.lowercased().hasPrefix("/o/oauth2/v2/auth/identifier") == true
    }
}
