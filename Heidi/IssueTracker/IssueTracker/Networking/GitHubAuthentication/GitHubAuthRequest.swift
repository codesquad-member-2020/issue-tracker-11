//
//  GitHubAuthRequest.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

struct GitHubAuthRequest: Request {
    var path: String {
        Endpoints.gitHubAuthURL
    }
}
