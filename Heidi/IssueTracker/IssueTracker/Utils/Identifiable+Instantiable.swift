//
//  Identifiable+Instantiable.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

protocol Instantiable: Identifiable where Self: UIViewController { }

extension Instantiable {
    static func instantiate(from storyboard: StoryboardRouter = .main) -> Self? {
        return storyboard.load(viewControllerType: self)
    }
}
