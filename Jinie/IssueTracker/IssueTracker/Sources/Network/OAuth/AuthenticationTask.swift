//
//  AuthenticationTask.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/17.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

protocol AuthenticationTask {
    func perform(request: Request, _ completionHandler: @escaping (Result<String, Error>) -> Void)
}
