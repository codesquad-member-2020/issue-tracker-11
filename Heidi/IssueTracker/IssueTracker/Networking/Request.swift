//
//  Request.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var query: [String: String] { get }
    var header: [String: String] { get }
    var body: Data? { get }
    func url() -> URL?
    func urlRequest() -> URLRequest?
}

extension Request {
    var method: HTTPMethod {
        return .get
    }
    
    var query: [String: String] {
        return [:]
    }
    
    var header: [String: String] {
        return [:]
    }
    
    var body: Data? {
        return nil
    }
    
    func url() -> URL? {
        guard var urlComponents = URLComponents(string: path) else { return nil }
        urlComponents.queryItems = query.map { URLQueryItem(name: $0, value: $1) }
        return urlComponents.url
    }
    
    func urlRequest() -> URLRequest? {
        guard let url = url() else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        header.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        request.httpBody = body
        return request
    }
    
    func encode<T: Encodable>(_ value: T) -> Data? {
        let data: Data
        do {
            data = try JSONEncoder().encode(value)
        } catch {
            return nil
        }
        return data
    }
}
