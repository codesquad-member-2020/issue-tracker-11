//
//  LoginUseCase.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct LoginUseCase {
    func fetch() -> String? {
        return LoginStorageTask(storage: DefaultStorage<String>()).fetch()
    }
    
    func store(token: String) {
        LoginStorageTask(storage: DefaultStorage<String>()).store(token)
    }
}
