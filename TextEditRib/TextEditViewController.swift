//
//  TextEditViewController.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import UIKit

import RIBs
import RxSwift
import RxCocoa
import SnapKit

class TextEditViewController: UIViewController, TextEditPresentable, TextEditViewControllable {
    
    // Sub view
    private let textField: UITextField = .init()
    private let button: UIButton = .init()
    
    // Input publishers, public interface
    private(set) lazy var editingText: Observable<String> = textField.rx.text.compactMap({$0}).asObservable()
    private(set) lazy var buttonClicked: Observable<Void> = button.rx.tap.asObservable()
    
    //
    private let disposeBag: DisposeBag = .init()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        
        // textField
        textField.font = .preferredFont(forTextStyle: .body)
        textField.textColor = .black
        textField.backgroundColor = UIColor.lightGray
        
        // button
        button.setTitle("present detail", for: .normal)
        button.setTitleColor(.blue, for: .normal)
    }
    
    private func setLayout() {
        
        let stack: UIStackView = .init(arrangedSubviews: [
            textField, button
        ])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .fill
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
}


// MARK: TextEditPresentable
extension TextEditViewController {
    
    func bind(listener: TextEditPresenterListener) {
        
        // Output only
        listener
            .displayButton
            .map({ !$0 })
            .bind(to: button.rx.isHidden)
            .disposed(by: disposeBag)
    }
}



// MARK: TextEditViewControllable
extension TextEditViewController {
    
    func present(_ viewControllable: any ViewControllable) {
        
        let vc = viewControllable.uiviewController
        self.present(vc, animated: true)
    }
    
    func dismiss(_ viewControllable: any ViewControllable) {
        
        let vc = viewControllable.uiviewController
        vc.dismiss(animated: true)
    }
}
