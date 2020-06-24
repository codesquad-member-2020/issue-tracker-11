//
//  Shadow.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/24.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

protocol Shadow where Self: UIView { }

extension Shadow {
    func configureShadow(
        color: UIColor = .black,
        offset: CGSize = CGSize(width: 0, height: 0),
        radius: CGFloat = 10,
        opacity: Float = 0.2
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }
}
