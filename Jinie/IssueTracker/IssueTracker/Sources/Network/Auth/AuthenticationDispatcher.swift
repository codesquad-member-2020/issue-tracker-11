//
//  AuthenticationDispatcher.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/17.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

protocol AuthenticationDispatcher {
    func execute(request: Request, _ completionHandler: @escaping (Result<URL, Error>) -> Void)
}
