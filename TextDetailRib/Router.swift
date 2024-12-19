//
//  Router.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import RIBs

class TextDetailRouter: ViewableRouter<TextDetailInteractable, TextDetailViewControllable>, TextDetailRouting {
    
    override init(interactor: TextDetailInteractable, viewController: TextDetailViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
    }
}


// MARK: TextDetailRouting
extension TextDetailRouter {
    
    
}
