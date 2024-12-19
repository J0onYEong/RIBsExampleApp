//
//  Router.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//


import RIBs


final class TextEditRouter: ViewableRouter<TextEditInteractable, TextEditViewControllable>, TextEditRouting {
    
    
    override init(
        interactor: any TextEditInteractable,
        viewController: any TextEditViewControllable
    ) {
        
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
        
    }
    
    
    func dettachTextDetailRib() {
        
        // 디테일 화면 아웃
    }
}
