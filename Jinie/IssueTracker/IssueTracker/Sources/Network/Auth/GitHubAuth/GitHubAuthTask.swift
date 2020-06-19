//
//  GitHubAuthTask.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/17.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

final class GitHubAuthTask: AuthenticationTask {
    let dispatcher: AuthenticationDispatcher
    
    init(dispatcher: AuthenticationDispatcher) {
        self.dispatcher = dispatcher
    }
    
    func perform(request: Request, _ completionHandler: @escaping (Result<String, Error>) -> Void) {
        dispatcher.execute(request: request) { result in
            if case .success(let url) = result {
                completionHandler(.success(self.token(of: url.absoluteString)))
            }
        }
    }
    
    private func token(of url: String) -> String {
        let queryItems = URLComponents(string: url)?.queryItems
        return queryItems?.filter({ $0.name == UserPreferences.tokenKey }).first?.value ?? ""
    }
}
