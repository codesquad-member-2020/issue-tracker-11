//
//  SceneDelegate.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/09.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        if let _ = LoginUseCase().fetch() {
            window?.rootViewController = DashboardViewController.instantiate()
        } else {
            window?.rootViewController = SignInViewController.instantiate()
        }
    }
    
    func changeRootViewController(to viewController: UIViewController, animated: Bool = true) {
        guard let window = self.window else { return }
        window.rootViewController = viewController
        UIView.transition(with: window, duration: 0.5, options: [.transitionFlipFromLeft], animations: nil)
    }
}
