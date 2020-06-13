//
//  ASWebAuthenticationSessionProtocol.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import AuthenticationServices

protocol WebAuthenticatable {
    init(url URL: URL, callbackURLScheme: String?, completionHandler: @escaping (URL?, Error?) -> Void)
    
    static func token(url: URL?) -> String?
}

extension ASWebAuthenticationSession: WebAuthenticatable {
    static func token(url: URL?) -> String? {
        guard let url = url else { return nil }
        let queryItems = URLComponents(string: url.absoluteString)?.queryItems
        return queryItems?.filter({ $0.name == "token" }).first?.value
    }
}
