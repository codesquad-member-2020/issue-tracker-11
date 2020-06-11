//
//  ASWebAuthenticationSessionProtocol.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/11.
//  Copyright © 2020 jinie. All rights reserved.
//

import AuthenticationServices

protocol ASWebAuthenticationSessionProtocol {

    init(url URL: URL, callbackURLScheme: String?, completionHandler: @escaping (URL?, Error?) -> Void)
}

extension ASWebAuthenticationSession: ASWebAuthenticationSessionProtocol {
    
}
