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
    private let cornerRadius: CGFloat = 5.0
    
    @IBAction func gitHubAuthButtonTapped(_ sender: UIButton) {
        signInWithGitHub()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGitHubAuthButton()
        configureAppleAuthButton()
    }
    
    private func configureGitHubAuthButton() {
        gitHubAuthButton.layer.cornerRadius = cornerRadius
        gitHubAuthButton.layer.masksToBounds = true
    }
    
    private func configureAppleAuthButton() {
        if traitCollection.userInterfaceStyle == .dark {
            appleAuthButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .white)
        } else {
            appleAuthButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
        }
        
        appleAuthButton.addTarget(self, action: #selector(signInWithApple), for: .touchUpInside)
        appleAuthButton.center = appleAuthButtonView.center
        appleAuthButton.frame = appleAuthButtonView.bounds
        appleAuthButton.cornerRadius = cornerRadius
        appleAuthButtonView.addSubview(appleAuthButton)
    }
    
    private func signInWithGitHub() {
        let gitHubAuthDispatcher = GitHubAuthDispatcher()
        let gitHubAuthTask = GitHubAuthTask(dispatcher: gitHubAuthDispatcher)
        
        gitHubAuthTask.perform(request: GitHubAuthRequest()) { result in
            if case .success(let token) = result {
                UserDefaults.standard.set(token, forKey: UserPreferences.tokenKey)
                self.presentTabBarController()
            }
        }
    }
    
    @objc func signInWithApple() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func presentTabBarController() {
        let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.modalTransitionStyle = .crossDissolve
        present(tabBarController, animated: true, completion: nil)
    }
}

extension SignInViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        guard let identityToken = credential.identityToken else { return }
        guard let token = String(data: identityToken, encoding: .utf8) else { return }
        
        UserDefaults.standard.set(token, forKey: UserPreferences.tokenKey)
        presentTabBarController()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        let alertController = UIAlertController(title: "Authorization failed",
                                                message: "\(error.localizedDescription)",
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

extension SignInViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
