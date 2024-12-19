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
public protocol TextEditBuildable: Buildable {

    func build(withListener lisner: TextEditListener) -> TextEditRouting
}


// MARK: Iteractor
protocol TextEditInteractable: AnyObject {
    
    // Interactor -> Router
    var router: TextEditRouting? { get set }
    
    // Interactor -> Super interactor
    var listener: TextEditListener? { get set }
}


// MARK: Router
// Interactor -> Router
// Super Router -> Router
public protocol TextEditRouting: ViewableRouting {
    
    func attachTextDetailRib()
    
    func dettachTextDetailRib()
}

// Router -> Presenter(ViewController)
protocol TextEditViewControllable: UIViewController, ViewControllable {
    
    func present(_ viewControllable: ViewControllable)
    
    func dismiss(_ viewControllable: ViewControllable)
}


// MARK: Presenter
// Presenter -> Interactor
protocol TextEditPresenterListener: AnyObject {
    
    // view models
    var displayButton: Observable<Bool> { get }
    var initialText: Single<String> { get }
}

// Interactor -> Presenter
protocol TextEditPresentable: AnyObject {
    
    // Inputs
    var editingText: Observable<String> { get }
    var buttonClicked: Observable<Void> { get }
    
    func bind(listener: TextEditPresenterListener)
}
