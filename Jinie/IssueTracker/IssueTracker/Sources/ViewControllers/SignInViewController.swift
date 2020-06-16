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
    
    enum OAuthURL {
        static let requestURL = "http://52.78.203.80/api/login"
        static let scheme = "io.codesquad.issuetracker.app"
    }
    
    private var session: ASWebAuthenticationSession?
    private let cornerRadius: CGFloat = 5.0
    
    @IBAction func gitHubButtonTapped(_ sender: UIButton) {
        showTabBarController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGitHubButton()
    }
    
    private func showTabBarController() {
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
