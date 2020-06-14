//
//  GitHubAuthUseCase.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct GitHubAuthUseCase {
    func request(completion: @escaping (String) -> Void, failure: @escaping (Error) -> Void) {
        GitHubAuthTask(dispatcher: GitHubAuthSession()).perform(GitHubAuthRequest()) { result in
            switch result {
            case let .success(token): completion(token)
            case let .failure(error): failure(error)
            }
        }
    }
}
