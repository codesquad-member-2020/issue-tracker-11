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
            guard let callbackURL = callbackURL, error == nil else { return }
            let queryItems = URLComponents(string: callbackURL.absoluteString)?.queryItems
            let token = queryItems?.filter({ $0.name == "token" }).first?.value
            UserDefaults.standard.set(token, forKey: "token")
        })
        session?.presentationContextProvider = self
        session?.start()
    }
}

extension SignInViewController: ASWebAuthenticationPresentationContextProviding {
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window!
    }
}
