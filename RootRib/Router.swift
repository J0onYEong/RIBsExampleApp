//
//  Router.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import UIKit

import TextEditRib

import RIBs

class RootRouter: Router<RootInteractable>, RootRouting {
    
    private let textEditRibBuilder: TextEditBuildable
    private let navigationController: UINavigationController
    
    init(
        textEditRibBuilder: TextEditBuildable,
        navigationController: UINavigationController,
        interactor: RootInteractable
    ) {
        
        self.textEditRibBuilder = textEditRibBuilder
        self.navigationController = navigationController
        
        super.init(interactor: interactor)
        
        interactor.router = self
    }
}


// MARK: RootRouting
extension RootRouter {
    
    func attachEditTextRib() {
        let router = textEditRibBuilder.build(
            withListener: interactor
        )
        attachChild(router)
        
        let vc = router.viewControllable.uiviewController
        navigationController.pushViewController(vc, animated: false)
    }
}
