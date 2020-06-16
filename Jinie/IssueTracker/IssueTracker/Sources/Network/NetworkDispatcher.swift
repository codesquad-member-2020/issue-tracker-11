//
//  NetworkDispatcher.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/16.
//  Copyright © 2020 jinie. All rights reserved.
//

import Foundation

protocol NetworkDispatcher {
    func execute(request: Request, _ completionHandler: @escaping (Result<Codable, Error>) -> Void)
}
