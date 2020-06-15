//
//  LoginUseCase.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct LoginUseCase {
    func store(token: String) {
        LoginStorageTask(storage: DefaultStorage<String>()).store(token)
    }
}
