//
//  Builder.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import RIBs

public final class TextDetailBuilder: Builder<TextDetailDependency>, TextDetailBuildable {
    
    public func build(withListener listener: TextDetailListener) -> TextDetailRouting {
        
        let component = TextDetailComponent(dependency: dependency)
        
        let viewController = TextDetailViewController()
        
        let interactor: TextDetailInteractable = TextDetailInteractor(
            presenter: viewController,
            listener: listener
        )
        
        let router: TextDetailRouting = TextDetailRouter(
            interactor: interactor,
            viewController: viewController
        )
        
        return router
    }
}
