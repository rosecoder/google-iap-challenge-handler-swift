import XCTest
@testable import GoogleIAPChallengeHandler

final class URLTests: XCTestCase {

    func testIsGoogleIAPChallenge() {
        XCTAssertTrue(URL(string: "https://accounts.google.com/o/oauth2/v2/auth/identifier?client_id=abc")!.isGoogleIAPChallenge)
        XCTAssertTrue(URL(string: "https://accounts.google.com/o/oauth2/V2/auth/IDENTIfIER?client_id=abc")!.isGoogleIAPChallenge)

        XCTAssertFalse(URL(string: "https://google.com/")!.isGoogleIAPChallenge)

        XCTAssertFalse(URL(string: "https://accounts.google.com/")!.isGoogleIAPChallenge)
    }
}
