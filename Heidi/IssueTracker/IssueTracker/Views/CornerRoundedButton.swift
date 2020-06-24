//
//  CornerRoundedButton.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/10.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

@IBDesignable final class CornerRoundedButton: UIButton, CornerRadius {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet { configure(cornerRadius: cornerRadius) }
    }
}
