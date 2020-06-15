//
//  DefaultStorage.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct DefaultStorage<Content>: Storage {
    private let storage: UserDefaults
    
    init(with storage: UserDefaults = .standard) {
        self.storage = storage
    }
    
    func read<Content>(for key: StorageKey<Content>) -> Content? {
        return storage[key]
    }
    
    func write<Content>(_ newValue: Content, for key: StorageKey<Content>) {
        storage[key] = newValue
    }
}

extension UserDefaults {
    subscript<Content>(key: StorageKey<Content>) -> Content? {
        get { return object(forKey: key.value) as? Content }
        set { set(newValue, forKey: key.value) }
    }
}
