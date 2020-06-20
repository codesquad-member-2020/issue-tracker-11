//
//  GitHubAuthRequest.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/17.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

struct GitHubAuthRequest: Request {
    var url: URL = API.baseURL.appendingPathComponent("/login")
}
