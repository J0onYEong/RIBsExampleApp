//
//  Public.swift
//  RibsTest
//
//  Created by choijunios on 12/19/24.
//

import UIKit

import RIBs

public protocol RootDependency: Dependency {
    
    var navigationController: UINavigationController { get }
}

public protocol RootBuildable {
    
    func build() -> RootRouting
}

public protocol RootRouting: Routing {
    
    func attachEditTextRib()
}
