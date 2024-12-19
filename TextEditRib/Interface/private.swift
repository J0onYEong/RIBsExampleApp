//
//  private.swift
//  RibsTest
//
//  Created by choijunios on 12/19/24.
//

import UIKit

import RIBs
import RxSwift

// MARK: Builder
protocol TextEditBuildable: Buildable {

    func build(withListener lisner: TextEditListener) -> TextEditRouting
}


// MARK: Iteractor
protocol TextEditInteractable: AnyObject {
    
    var router: TextEditRouting? { get set }
    var listener: TextEditListener? { get set }
}


// MARK: Router
protocol TextEditRouting: AnyObject {
    
    func attachTextDetailRib()
    
    func dettachTextDetailRib()
}


protocol TextEditViewControllable: UIViewController, ViewControllable {
    
    func present(_ viewControllable: ViewControllable)
    
    func dismiss(_ viewControllable: ViewControllable)
}


// MARK: Presenter
protocol TextEditPresenterListener: AnyObject {
    
    // view models
    var displayButton: Observable<Bool> { get }
    var initialText: Single<String> { get }
}


protocol TextEditPresentable: AnyObject {
    
    // Inputs
    var editingText: Observable<String> { get }
    var buttonClicked: Observable<Void> { get }
    
    func bind(listener: TextEditPresenterListener)
}
