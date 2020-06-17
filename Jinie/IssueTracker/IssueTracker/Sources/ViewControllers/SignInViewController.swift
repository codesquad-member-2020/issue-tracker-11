//
//  SignInViewController.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/09.
//  Copyright © 2020 jinie. All rights reserved.
//

import UIKit
import AuthenticationServices

class SignInViewController: UIViewController {
    @IBOutlet weak var gitHubButton: UIButton!
    
    private let cornerRadius: CGFloat = 5.0
    
    @IBAction func gitHubButtonTapped(_ sender: UIButton) {
        presentTabBarController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGitHubButton()
    }
    
    private func presentTabBarController() {
        let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.modalTransitionStyle = .crossDissolve
        present(tabBarController, animated: true, completion: nil)
    }
    
    private func configureGitHubButton() {
        gitHubButton.layer.cornerRadius = cornerRadius
        gitHubButton.layer.masksToBounds = true
    }
}

extension SignInViewController: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window!
    }
}
