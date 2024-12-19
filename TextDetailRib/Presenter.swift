//
//  Presenter.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import UIKit

import RIBs
import RxSwift
import RxCocoa
import SnapKit

class TextDetailViewController: UIViewController, TextDetailViewControllable, TextDetailPresentable {
    
    // Sub view
    private let textView: UILabel = .init()
    private let closeButton: UIButton = .init()
    
    private(set)lazy var closeButtonClicked: Observable<Void> = closeButton.rx.tap.asObservable()
    
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
        
        view.backgroundColor = .white
        textView.font = .preferredFont(forTextStyle: .title1)
        textView.textColor = .red
        
        closeButton.setTitle("닫기", for: .normal)
        closeButton.setTitleColor(.blue, for: .normal)
    }
    
    private func setLayout() {
        
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().inset(20)
        }
    }
}


// MARK: TextDetailPresentable
extension TextDetailViewController {
    
    func bind(listener: TextDetailPresenterListener) {
        
        listener.textForDisplay
            .bind(to: textView.rx.text)
            .disposed(by: disposeBag)
    }
}


// MARK: TextDetailViewControllable
extension TextDetailViewController {
    
    
}
