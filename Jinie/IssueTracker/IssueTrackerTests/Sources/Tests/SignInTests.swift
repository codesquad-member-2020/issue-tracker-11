//
//  SignInTests.swift
//  IssueTrackerTests
//
//  Created by jinie on 2020/06/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import XCTest
@testable import IssueTracker

class SignInTests: XCTestCase {
    func testTokenUponSuccessfulAuthentication() {
        FakeASWebAuthenticationSession(url: URL(string: "https://example.com/auth")!, callbackURLScheme: nil) { (callbackURL, error) in
            let token = FakeASWebAuthenticationSession.token(url: callbackURL)
            XCTAssertNotNil(token)
        }
    }
}
