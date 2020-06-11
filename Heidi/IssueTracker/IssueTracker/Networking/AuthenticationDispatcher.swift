//
//  AuthenticationDispatcher.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

enum AuthenticationError: Error {
    case invalidURL
    case notFound
}

protocol AuthenticationDispatcher {
    func execute(request: Request, completion: @escaping (Result<String, Error>) -> Void)
}
