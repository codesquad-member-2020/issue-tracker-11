//
//  StoryboardRouter.swift
//  IssueTracker
//
//  Created by Chaewan Park on 2020/06/15.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

enum StoryboardRouter: String {
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: .main)
    }
    
    func load<T: UIViewController>(viewControllerType: T.Type) -> T? where T: Identifiable {
        let storyboardID = viewControllerType.identifier
        return instance.instantiateViewController(withIdentifier: storyboardID) as? T
    }
}
