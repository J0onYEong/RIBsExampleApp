//
//  Router.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import TextDetailRib

import RIBs

final class TextEditRouter: ViewableRouter<TextEditInteractable, TextEditViewControllable>, TextEditRouting {
    
    private let textDetailBuilder: TextDetailBuildable
    
    init(
        textDetailBuilder: TextDetailBuildable,
        interactor: TextEditInteractable,
        viewController: TextEditViewControllable
    ) {
        
        self.textDetailBuilder = textDetailBuilder
        
        // 인터렉터와 ViewControllable에 대한 참조가 이루어짐
        super.init(
            interactor: interactor,
            viewController: viewController
        )
        
        interactor.router = self
    }
    
}


// MARK: TextEditRouting
extension TextEditRouter {
    
    func attachTextDetailRib() {
        
        // 디테일 화면을 표출
        let textDetailRouter = textDetailBuilder.build(
            withListener: interactor
        )
        attachChild(textDetailRouter)
        
        viewController.present(textDetailRouter.viewControllable)
    }
    
    
    func dettachTextDetailRib() {
        
        let router = children.first(where: {
            $0 is TextDetailRouting
        }) as! TextDetailRouting
        
        // 디테일 화면 아웃
        viewController.dismiss(router.viewControllable)
        detachChild(router)
    }
}
