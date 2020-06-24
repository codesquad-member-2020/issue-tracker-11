//
//  IssueDetailViewController.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/24.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class IssueDetailViewController: UIViewController, Instantiable {
    
    enum Position {
        case full, folded
        
        var y: CGFloat {
            switch self {
            case .full: return UIScreen.main.bounds.height
            case .folded: return UIScreen.main.bounds.height - 150
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let frame = self?.view.frame else { return }
            self?.view.frame = CGRect(x: 0, y: Position.folded.y, width: frame.width, height: frame.height)
        }
    }
}
