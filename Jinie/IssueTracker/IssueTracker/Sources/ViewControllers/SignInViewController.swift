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
    @IBOutlet weak var gitHubAuthButton: UIButton!
    @IBOutlet weak var appleAuthButtonView: UIView!
    
    private var appleAuthButton: ASAuthorizationAppleIDButton!
    
    @IBAction func gitHubAuthButtonTapped(_ sender: UIButton) {
        signInWithGitHub()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGitHubAuthButton()
        configureAppleAuthButton()
    }
    
    private func signInWithGitHub() {
        let dispatcher = GitHubAuthDispatcher()
        let task = GitHubAuthTask(dispatcher: dispatcher)
        
        task.perform(request: GitHubAuthRequest()) { result in
            if case .success(let token) = result {
                UserDefaults.standard.set(token, forKey: "token")
                self.presentTabBarController()
            }
        }
    }
    
    private func presentTabBarController() {
        let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.modalTransitionStyle = .crossDissolve
        present(tabBarController, animated: true, completion: nil)
    }
    
    private func configureGitHubAuthButton() {
        gitHubAuthButton.layer.cornerRadius = 6.0
        gitHubAuthButton.layer.masksToBounds = true
    }
    
    private func configureAppleAuthButton() {
        if traitCollection.userInterfaceStyle == .dark {
            appleAuthButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .white)
        } else {
            appleAuthButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
        }
        
        appleAuthButton.center = appleAuthButtonView.center
        appleAuthButton.frame = appleAuthButtonView.bounds
        appleAuthButtonView.addSubview(appleAuthButton)
    }
}
