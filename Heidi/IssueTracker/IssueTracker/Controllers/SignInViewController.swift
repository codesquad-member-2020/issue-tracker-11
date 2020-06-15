//
//  SignInViewController.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/09.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        GitHubAuthUseCase().request(completion: { token in
            LoginUseCase().store(token: token)
        }, failure: { _ in
            self.present(AlertController.networkError, animated: false)
        })
    }
}
