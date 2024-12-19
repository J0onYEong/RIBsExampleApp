//
//  Private.swift
//  RibsTest
//
//  Created by choijunios on 12/19/24.
//

import RIBs
import RxSwift

// MARK: Interactor
protocol TextDetailInteractable: AnyObject {
    
    var router: TextDetailRouting? { get set }
    var listener: TextDetailListener? { get set }
}

// MARK: Presenter
// Interactor -> Presenter
protocol TextDetailPresentable: Presentable {
    
    var closeButtonClicked: Observable<Void> { get }
    
    func bind(listener: TextDetailPresenterListener)
}

// Presenter -> Interactor
protocol TextDetailPresenterListener: AnyObject {
    
    var textForDisplay: Observable<String> { get }
}

// Router -> Presenter
protocol TextDetailViewControllable: ViewControllable {
    
}

