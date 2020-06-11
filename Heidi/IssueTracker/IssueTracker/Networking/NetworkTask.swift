//
//  NetworkTask.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

protocol NetworkTask {
    associatedtype Input: Request
    associatedtype Output
    
    func perform(_ request: Input, completion: @escaping (Result<Output, Error>) -> Void)
}
