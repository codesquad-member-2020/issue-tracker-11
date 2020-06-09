//
//  SignInViewController.swift
//  IssueTracker
//
//  Created by jinie on 2020/06/09.
//  Copyright © 2020 jinie. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    
    private let cornerRadius: CGFloat = 5.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
    }
    
    private func configureButton() {
        signInButton.layer.cornerRadius = cornerRadius
        signInButton.layer.masksToBounds = true
    }
}
