//
//  StorageTask.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

protocol StorageTask {
    associatedtype Object
    
    func fetch() -> Object?
    func store(_ value: Object)
}
