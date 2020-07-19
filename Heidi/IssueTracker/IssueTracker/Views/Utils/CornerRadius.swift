//
//  CornerRadius.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/24.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

protocol CornerRadius where Self: UIView { }

extension CornerRadius {
    func configure(cornerRadius: CGFloat = 20) {
        layer.cornerRadius = cornerRadius
    }
}
