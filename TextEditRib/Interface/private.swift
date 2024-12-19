//
//  private.swift
//  RibsTest
//
//  Created by choijunios on 12/19/24.
//

import UIKit

import TextDetailRib

import RIBs
import RxSwift

// MARK: Iteractor
protocol TextEditInteractable: AnyObject, TextDetailListener {
    
    // Interactor -> Router
    var router: TextEditRouting? { get set }
    
    // Interactor -> Super interactor
    var listener: TextEditListener? { get set }
}


// MARK: Router

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
