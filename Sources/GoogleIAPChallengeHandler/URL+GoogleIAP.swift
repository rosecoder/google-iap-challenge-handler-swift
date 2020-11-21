import Foundation

extension URL {

    public var isGoogleIAPChallenge: Bool {
        host?.lowercased() == "accounts.google.com" && (
            path.lowercased().hasPrefix("/o/oauth2/v2/auth/identifier") == true ||
            path.lowercased().hasPrefix("/servicelogin") == true
        )
    }
}

