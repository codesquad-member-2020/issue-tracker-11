//
//  Request.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/16.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol Request {
    var url: URL { get }
    var method: HTTPMethod { get }
    var parameters: [String : Any]? { get }
    var headers: [String : String]? { get }
}

extension Request {
    var method: HTTPMethod { return .get }
    var parameters: [String : Any]? { return nil }
    var headers: [String : String]? { return nil }
}
