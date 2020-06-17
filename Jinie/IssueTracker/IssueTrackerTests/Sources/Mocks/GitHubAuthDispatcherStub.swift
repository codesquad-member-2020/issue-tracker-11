//
//  GitHubAuthDispatcherStub.swift
//  IssueTrackerTests
//
//  Created by jinie on 2020/06/17.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation
@testable import IssueTracker

final class GitHubAuthDispatcherStub: AuthenticationDispatcher {
    let token: String
    
    init(token: String) {
        self.token = token
    }
    
    func execute(request: Request, _ completionHandler: @escaping (Result<URL, Error>) -> Void) {
        completionHandler(.success(URL(string: "io.codesquad.issuetracker.app:/?token=\(token)")!))
    }
}
