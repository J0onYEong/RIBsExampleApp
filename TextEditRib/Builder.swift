//
//  Builder.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import TextDetailRib

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
            listener: lisner,
            presenter: viewContrller
        )
        
        
        // TextDetail Builder
        let textDetailBuilder: TextDetailBuildable = TextDetailBuilder(
            dependency: component
        )
        
        
        // Router
        let router: TextEditRouting = TextEditRouter(
            textDetailBuilder: textDetailBuilder,
            interactor: interactor,
            viewController: viewContrller
        )
        
        return router
    }
}
