import Foundation

extension URLResponse {

    public func handleGoogleIAPChallengeIfNeeded(fromView parentView: ChallengeHandler.View, originalURL: URL, completion: @escaping ChallengeHandler.Completion) {
        guard url?.isGoogleIAPChallenge == true else {
            completion(.success(()))
            return
        }

        DispatchQueue.main.async {
            let handler = ChallengeHandler(url: originalURL, completion: completion)
            handler.handle(fromView: parentView)
        }
    }
}
