//
//  IssueDetailViewController.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/24.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class IssueDetailViewController: UIViewController, Instantiable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.moveSelf(to: .folded)
        }
    }
    
    @IBAction func panGestureRecognized(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        moveSelf(to: Position.free(yPosition: view.frame.minY + translation.y))
        sender.setTranslation(.zero, in: view)
    }
    
    private func moveSelf(to position: Position) {
        view.frame = view.frame.yPositionMoved(to: position.yPosition)
    }
}

extension IssueDetailViewController {
    
    enum Position {
        case full, folded, free(yPosition: CGFloat)
        
        var yPosition: CGFloat {
            switch self {
            case .full: return 100
            case .folded: return UIScreen.main.bounds.height - 150
            case let .free(yPosition): return boundaryLimited(yPosition)
            }
        }
        
        private func boundaryLimited(_ value: CGFloat) -> CGFloat {
            if value < Self.full.yPosition { return Self.full.yPosition }
            if value > Self.folded.yPosition { return Self.folded.yPosition }
            return value
        }
    }
}

private extension CGRect {
    func yPositionMoved(to position: CGFloat) -> CGRect {
        return CGRect(x: origin.x, y: position, width: width, height: height)
    }
}
