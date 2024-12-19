//
//  Builder.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import RIBs

public final class TextEditBuilder: Builder<TextEditDependency>, TextEditBuildable {
    
    
    public func build(withListener lisner: TextEditListener) -> TextEditRouting {
        
        // Component
        let component: EditTextComponent = .init(dependency: self.dependency)
        
        
        // Presenter
        let viewContrller = TextEditViewController()
        
        
        // Interactor
        let interactor: TextEditInteractable = TextEditInteracter(
            initialText: component.initialText,
            presenter: viewContrller
        )
        
        
        // Router
        let router: TextEditRouting = TextEditRouter(
            interactor: interactor,
            viewController: viewContrller
        )
        
        return router
    }
}
