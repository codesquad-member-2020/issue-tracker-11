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

    func testSetToken() {
        FakeASWebAuthenticationSession(url: URL(string: "https://example.com/auth")!, callbackURLScheme: nil) { (callbackURL, error) in
            guard let callbackURL = callbackURL else { return }
            let queryItems = URLComponents(string: callbackURL.absoluteString)?.queryItems
            let token = queryItems?.filter({ $0.name == "token" }).first?.value
            UserDefaults.standard.set(token, forKey: "token")
            XCTAssertNotNil(UserDefaults.standard.string(forKey: "token"))
        }
    }
}
