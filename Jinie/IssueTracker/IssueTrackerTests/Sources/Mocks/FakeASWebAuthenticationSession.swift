//
//  FakeASWebAuthenticationSession.swift
//  IssueTrackerTests
//
//  Created by jinie on 2020/06/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import XCTest
@testable import IssueTracker

final class FakeASWebAuthenticationSession: WebAuthenticatable {
    private let callbackURL = URL(string: "https://example.com/auth?token=test")
    
    @discardableResult
    init(url URL: URL, callbackURLScheme: String?, completionHandler: @escaping (URL?, Error?) -> Void) {
        completionHandler(callbackURL, nil)
    }
    
    static func token(url: URL?) -> String? {
        guard let url = url else { return nil }
        let queryItems = URLComponents(string: url.absoluteString)?.queryItems
        return queryItems?.filter({ $0.name == "token" }).first?.value
    }
}
