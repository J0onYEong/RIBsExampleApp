//
//  Builder.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import TextEditRib

import RIBs

public class RootBuilder: Builder<RootDependency>, RootBuildable {
    
    public func build() -> RootRouting {
        
        let component: RootComponent = .init(dependency: dependency)
        
        let interactor: RootInteractable = RootInteractor()
        
        let textEditBuilder: TextEditBuildable = TextEditBuilder(dependency: component)
        
        let router: RootRouting = RootRouter(
            textEditRibBuilder: textEditBuilder,
            navigationController: dependency.navigationController,
            interactor: interactor
        )
        
        return router
    }
}
