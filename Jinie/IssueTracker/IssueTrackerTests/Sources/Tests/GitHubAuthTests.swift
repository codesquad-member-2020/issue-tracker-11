//
//  GitHubAuthTests.swift
//  IssueTrackerTests
//
//  Created by jinie on 2020/06/16.
//  Copyright © 2020 jinie. All rights reserved.
//

import XCTest
@testable import IssueTracker

class GitHubAuthTests: XCTestCase {
    func testGitHubAuth() {
        let expectedToken = "test"
        let dispatcher = GitHubAuthDispatcherStub(token: expectedToken)
        let gitHubAuthTask = GitHubAuthTask(dispatcher: dispatcher)
        
        gitHubAuthTask.perform(request: GitHubAuthRequest()) { result in
            if case .success(let token) = result {
                XCTAssertEqual(token, expectedToken)
            }
        }
    }
}
