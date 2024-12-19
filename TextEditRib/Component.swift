//
//  Component.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import TextDetailRib

import RIBs

final class EditTextComponent: Component<TextEditDependency>, TextDetailDependency {
    
    var initialText: String {
        
        dependency.initialText
    }
}
