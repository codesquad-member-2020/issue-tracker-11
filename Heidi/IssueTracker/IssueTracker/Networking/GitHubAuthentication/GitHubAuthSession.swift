//
//  GitHubAuthSession.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation
import AuthenticationServices

final class GitHubAuthSession: NSObject, AuthenticationDispatcher {
    func execute(request: Request, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = request.url() else {
            completion(.failure(AuthenticationError.invalidURL))
            return
        }
        let session = ASWebAuthenticationSession(url: url, callbackURLScheme: GitHubAuthKeys.scheme) { callbackURL, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let url = callbackURL {
                completion(.success(url.absoluteString))
            } else {
                completion(.failure(AuthenticationError.urlNotFound))
            }
        }
        session.presentationContextProvider = self
        session.start()
    }
}

extension GitHubAuthSession: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}
