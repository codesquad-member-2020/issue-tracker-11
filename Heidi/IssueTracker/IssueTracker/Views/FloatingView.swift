//
//  FloatingView.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/24.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

final class FloatingView: UIView, Shadow, CornerRadius {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureShadow()
        configure(cornerRadius: 15)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureShadow()
        configure(cornerRadius: 15)
    }
}
