import XCTest
@testable import GoogleIAPChallengeHandler

final class URLTests: XCTestCase {

    func testIsGoogleIAPChallenge() {
        XCTAssertTrue(URLResponse(
            url: URL(string: "https://accounts.google.com/o/oauth2/v2/auth/identifier?client_id=abc")!,
            mimeType: nil,
            expectedContentLength: 0,
            textEncodingName: nil
        ).isGoogleIAPChallenge)
        XCTAssertTrue(URLResponse(
            url: URL(string: "https://accounts.google.com/o/oauth2/V2/auth/IDENTIfIER?client_id=abc")!,
            mimeType: nil,
            expectedContentLength: 0,
            textEncodingName: nil
        ).isGoogleIAPChallenge)

        XCTAssertFalse(URLResponse(
            url: URL(string: "https://google.com/")!,
            mimeType: nil,
            expectedContentLength: 0,
            textEncodingName: nil
        ).isGoogleIAPChallenge)

        XCTAssertFalse(URLResponse(
            url: URL(string: "https://accounts.google.com/")!,
            mimeType: nil,
            expectedContentLength: 0,
            textEncodingName: nil
        ).isGoogleIAPChallenge)
    }
}
