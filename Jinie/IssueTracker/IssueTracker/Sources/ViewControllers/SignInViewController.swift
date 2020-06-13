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
    private var session: ASWebAuthenticationSession?
    
    @IBAction func gitHubButtonTapped(_ sender: UIButton) {
        signInWithGitHub()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGitHubButton()
    }
    
    private func configureGitHubButton() {
        gitHubButton.layer.cornerRadius = cornerRadius
        gitHubButton.layer.masksToBounds = true
    }
    
    private func signInWithGitHub() {
        session = ASWebAuthenticationSession(url: URL(string: "http://52.78.203.80/api/login")!, callbackURLScheme: "io.codesquad.issuetracker.app", completionHandler: { (callbackURL, error) in
            let token = ASWebAuthenticationSession.token(url: callbackURL)
            UserDefaults.standard.set(token, forKey: "token")
            self.presentTabBarController()
        })
        session?.presentationContextProvider = self
        session?.start()
    }
    
    private func presentTabBarController() {
        let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.modalTransitionStyle = .crossDissolve
        present(tabBarController, animated: true, completion: nil)
    }
}

extension SignInViewController: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window!
    }
}
