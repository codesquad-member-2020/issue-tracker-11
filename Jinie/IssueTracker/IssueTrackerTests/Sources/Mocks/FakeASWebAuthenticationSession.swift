//
//  FakeASWebAuthenticationSession.swift
//  IssueTrackerTests
//
//  Created by jinie on 2020/06/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import XCTest
@testable import IssueTracker

final class FakeASWebAuthenticationSession: ASWebAuthenticationSessionProtocol {
    
    let callbackURL = URL(string: "https://example.com/auth?token=test")
    
    @discardableResult
    init(url URL: URL, callbackURLScheme: String?, completionHandler: @escaping (URL?, Error?) -> Void) {
        completionHandler(callbackURL, nil)
    }
}
