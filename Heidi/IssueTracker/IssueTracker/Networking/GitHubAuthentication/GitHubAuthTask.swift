//
//  GitHubAuthTask.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct GitHubAuthTask: NetworkTask {
    typealias Input = GitHubAuthRequest
    typealias Output = String
    
    private let authenticationDispatcher: AuthenticationDispatcher
    
    init(dispatcher: AuthenticationDispatcher) {
        self.authenticationDispatcher = dispatcher
    }
    
    func perform(_ request: Input, completion: @escaping (Result<Output, Error>) -> Void) {
        authenticationDispatcher.execute(request: request) { result in
            switch result {
            case let .success(url): completion(self.unpack(from: url, with: GitHubAuthKeys.payloadKey))
            case let .failure(error): completion(.failure(error))
            }
        }
    }
    
    private func unpack(from url: String, with key: String) -> Result<Output, Error> {
        if let token = URLComponents(string: url)?.queryItems?.filter({ $0.name == key }).first?.value {
            return .success(token)
        }
        return .failure(AuthenticationError.tokenNotFound)
    }
}
