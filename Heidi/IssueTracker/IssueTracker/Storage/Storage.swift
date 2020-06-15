//
//  Storage.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct StorageKey<Content> {
    let value: String

    init(_ value: String) {
        self.value = value
    }
}

protocol Storage {
    associatedtype Content
    
    func read(for key: StorageKey<Content>) -> Content?
    func write(_ newValue: Content, for key: StorageKey<Content>)
}
