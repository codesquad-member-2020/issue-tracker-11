//
//  DashboardViewController.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

final class DashboardViewController: UIViewController, Instantiable {
    
    private let bottomSheetViewController = IssueDetailViewController.instantiate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureBottomSheet()
    }
    
    private func configureBottomSheet() {
        guard let viewController = bottomSheetViewController else { return }
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        viewController.view.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: view.frame.width)
    }
}
