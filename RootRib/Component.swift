//
//  Component.swift
//  RibsTest
//
//  Created by choijunios on 12/19/24.
//

import UIKit

import TextEditRib

import RIBs

class RootComponent: Component<RootDependency>, TextEditDependency {
    
    var initialText: String {
        
        "This is initial text"
    }
    
    var navigationController: UINavigationController {
        
        dependency.navigationController
    }
}
