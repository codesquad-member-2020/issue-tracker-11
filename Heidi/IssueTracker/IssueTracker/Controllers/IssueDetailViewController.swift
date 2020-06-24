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
        
        var yPosition: CGFloat {
            switch self {
            case .full: return 100
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
            self?.moveSelf(to: .folded)
        }
    }
    
    private func moveSelf(to position: Position) {
        view.frame = view.frame.yPositionMoved(to: position.yPosition)
    }
}

private extension CGRect {
    func yPositionMoved(to position: CGFloat) -> CGRect {
        return CGRect(x: origin.x, y: position, width: width, height: height)
    }
}
