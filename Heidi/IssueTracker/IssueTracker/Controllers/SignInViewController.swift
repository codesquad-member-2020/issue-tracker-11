//
//  SignInViewController.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/09.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

final class SignInViewController: UIViewController, Instantiable {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        GitHubAuthUseCase().request(completion: { token in
            LoginUseCase().store(token: token)
            self.change(to: DashboardViewController.instantiate())
        }, failure: { _ in
            self.present(AlertController.networkError, animated: false)
        })
    }
    
    private func change(to viewController: UIViewController?) {
        guard let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
            let viewController = viewController else { return }
        delegate.changeRootViewController(to: viewController)
    }
}
