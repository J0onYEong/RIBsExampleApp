//
//  Interactor.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import TextEditRib

import RIBs

class RootInteractor:
    Interactor,
    TextEditListener,
    RootInteractable {
    
    weak var router: RootRouting?
    
    override init() {
        super.init()
    }
}
