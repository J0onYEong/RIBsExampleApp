//
//  Component.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import RIBs

final class EditTextComponent: Component<TextEditDependency> {
    
    var initialText: String {
        
        dependency.initialText
    }
}
