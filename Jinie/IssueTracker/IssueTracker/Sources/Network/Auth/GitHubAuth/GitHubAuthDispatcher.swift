//
//  GitHubAuthDispatcher.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/17.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation
import AuthenticationServices

final class GitHubAuthDispatcher: NSObject, AuthenticationDispatcher {
    func execute(request: Request, _ completionHandler: @escaping (Result<URL, Error>) -> Void) {
        let session = ASWebAuthenticationSession(url: request.url, callbackURLScheme: API.scheme) { (callbackURL, error) in
            guard let callbackURL = callbackURL else { return }
            completionHandler(.success(callbackURL))
        }
        session.presentationContextProvider = self
        session.start()
    }
}

extension GitHubAuthDispatcher: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}
