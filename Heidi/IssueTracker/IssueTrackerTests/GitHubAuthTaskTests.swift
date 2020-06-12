//
//  GitHubAuthTaskTests.swift
//  IssueTrackerTests
//
//  Created by Chaewan Park on 2020/06/09.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import IssueTracker

final class GitHubAuthTaskTests: XCTestCase {
    func test_GitHubAuth_Fail_With_URLNotFound() {
        let exp = expectation(description: "Callback URL이 없다는 에러로 실패함")
        let dispatcherStub = AuthenticationDispatcherErrorStub()
        GitHubAuthTask(dispatcher: dispatcherStub).perform(GitHubAuthRequest()) {
            if case let .failure(error) = $0 {
                XCTAssertEqual(error as! AuthenticationError, AuthenticationError.urlNotFound)
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 1)
    }
    
    func test_GitHubAuth_Fail_With_TokenNotFound() {
        let exp = expectation(description: "토큰을 찾지 못했다는 에러로 실패함")
        let dispatcherStub = AuthenticationDispatcherNoTokenStub()
        GitHubAuthTask(dispatcher: dispatcherStub).perform(GitHubAuthRequest()) {
            if case let .failure(error) = $0 {
                XCTAssertEqual(error as! AuthenticationError, AuthenticationError.tokenNotFound)
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 1)
    }
    
    func test_GitHubAuth_Success() {
        let exp = expectation(description: "토큰 파싱 성공함")
        let expectedToken = "jwtToken"
        let dispatcherStub = AuthenticationDispatcherSuccessStub(with: expectedToken)
        GitHubAuthTask(dispatcher: dispatcherStub).perform(GitHubAuthRequest()) {
            if case let .success(token) = $0 {
                XCTAssertEqual(token, expectedToken)
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 1)
    }
}

struct AuthenticationDispatcherErrorStub: AuthenticationDispatcher {
    func execute(request: Request, completion: @escaping (Result<String, Error>) -> Void) {
        completion(.failure(AuthenticationError.urlNotFound))
    }
}

struct AuthenticationDispatcherNoTokenStub: AuthenticationDispatcher {
    func execute(request: Request, completion: @escaping (Result<String, Error>) -> Void) {
        completion(.success("io.codesquad.issuetracker.app:/?"))
    }
}

struct AuthenticationDispatcherSuccessStub: AuthenticationDispatcher {
    private let token: String
    
    init(with token: String) {
        self.token = token
    }
    
    func execute(request: Request, completion: @escaping (Result<String, Error>) -> Void) {
        completion(.success("io.codesquad.issuetracker.app:/?token=\(token)"))
    }
}
