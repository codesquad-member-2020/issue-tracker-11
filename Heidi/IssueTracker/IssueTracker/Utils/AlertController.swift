//
//  AlertController.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/13.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

struct AlertController {
    static let networkError: UIAlertController = {
        let alert = UIAlertController(title: "Network Error",
                                      message: "Please check your network connection",
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        return alert
    }()
}
