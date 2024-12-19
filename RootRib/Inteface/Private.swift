//
//  Private.swift
//  RibsTest
//
//  Created by choijunios on 12/19/24.
//

import TextEditRib

// MARK: Interactor
protocol RootInteractable: AnyObject, TextEditListener {
    
    var router: RootRouting? { get set }
}
