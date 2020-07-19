//
//  LoginStorageTaskTests.swift
//  IssueTrackerTests
//
//  Created by Chaewan Park on 2020/06/16.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import IssueTracker

final class LoginStorageTaskTests: XCTestCase {
    func test_Fetching_UserID() {
        let expectedUserID = "ABC"
        let storageStub = StorageUserIDStub(value: expectedUserID)
        let userID = LoginStorageTask(storage: storageStub).fetch()
        XCTAssertEqual(userID, expectedUserID)
    }
    
    func test_Storing_UserID() {
        let storageSpy = StorageSpy()
        let storageTask = LoginStorageTask(storage: storageSpy)
        let expectedValue = "CBA"
        storageTask.store(expectedValue)
        XCTAssertEqual(storageSpy.storedValue, expectedValue)
    }
}

struct StorageUserIDStub: Storage {
    private let value: String
    
    init(value: String) {
        self.value = value
    }
    
    func read<Content>(for key: StorageKey<Content>) -> Content? {
        return value as? Content
    }
    
    func write<Content>(_ newValue: Content, for key: StorageKey<Content>) { }
}

final class StorageSpy: Storage {
    var storedValue: String?
    
    func read<Content>(for key: StorageKey<Content>) -> Content? { return nil }
    
    func write<Content>(_ newValue: Content, for key: StorageKey<Content>) {
        guard let value = newValue as? String else { return }
        storedValue = value
    }
}
