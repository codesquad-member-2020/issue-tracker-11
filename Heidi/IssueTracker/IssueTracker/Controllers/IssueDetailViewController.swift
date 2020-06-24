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
        
        UIView.animate(withDuration: 0.5) {
            self.moveSelf(to: .folded)
        }
    }
    
    @IBAction func panGestureRecognized(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)
        let positionToMove = view.frame.minY + translation.y
        moveSelf(to: .free(yPosition: positionToMove))
        recognizer.setTranslation(.zero, in: view)
        
        if recognizer.state == .ended {
            UIView.animate(withDuration: 0.2) {
                self.moveSelf(to: .nearerPosition(current: positionToMove))
            }
        }
    }
    
    private func moveSelf(to position: Position) {
        view.frame = view.frame.yPositionMoved(to: position.yPosition)
    }
}

extension IssueDetailViewController {
    
    enum Position {
        case full, folded, nearerPosition(current: CGFloat), free(yPosition: CGFloat)
        
        var yPosition: CGFloat {
            switch self {
            case .full: return 100
            case .folded: return UIScreen.main.bounds.height - 150
            case let .nearerPosition(current): return nearerPosition(from: current)
            case let .free(yPosition): return boundaryLimited(yPosition)
            }
        }
        
        func nearerPosition(from current: CGFloat) -> CGFloat {
            let distanceToFull = abs(current - Self.full.yPosition)
            let distanceToFolded = abs(current - Self.folded.yPosition)
            return distanceToFull < distanceToFolded ? Self.full.yPosition : Self.folded.yPosition
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
