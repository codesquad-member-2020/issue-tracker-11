//
//  LoginStorageTask.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct LoginStorageTask: StorageTask {
    typealias Object = String

    enum Key {
        static let userID = StorageKey<String>("userID")
    }

    private let storage: Storage

    init(storage: Storage) {
        self.storage = storage
    }
    
    func fetch() -> Object? {
        return storage.read(for: Key.userID)
    }

    func store(_ value: Object) {
        storage.write(value, for: Key.userID)
    }
}
