//
//  Interactor.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import RIBs
import RxSwift

final class TextEditInteracter:
    PresentableInteractor<TextEditPresentable>,
    TextEditInteractable,
    TextEditPresenterListener {
    
    
    // Interactor -> Router
    weak var router: TextEditRouting?
    
    
    // Interactor -> 상위 Interactor
    weak var listener: TextEditListener?
    
    
    // Presenter에게 전달될 아웃풋
    private let displayButtonPublisher: BehaviorSubject<Bool> = .init(value: false)
    
    // - view models
    private(set) lazy var displayButton: Observable<Bool> = displayButtonPublisher.asObservable()
    let initialText: Single<String>
    
    
    private let disposeBag: DisposeBag = .init()
    
    
    init(initialText: String, presenter: TextEditPresentable) {
        
        self.initialText = Single.just(initialText)
        
        super.init(presenter: presenter)
    }
    
    
    override func didBecomeActive() {
        super.didBecomeActive()
        
        // bind output
        bindPresenter()
        
        // bind input(input -> output)
        presenter.bind(listener: self)
    }
    
    
    // 프레젠터의 인풋(액션)을 획득
    private func bindPresenter() {
        
        presenter
            .editingText
            .withUnretained(self)
            .map { interactor, text in
                interactor.checkTextAvailable(text)
            }
            .bind(to: displayButtonPublisher)
            .disposed(by: disposeBag)
        
        
        presenter
            .buttonClicked
            .withUnretained(self)
            .subscribe(onNext: { interactor, _ in
                
                // 디테일 화면 디스플레이
                interactor.router?.attachTextDetailRib()
                
            })
            .disposed(by: disposeBag)
    }
    
    
    // Business logic
    private func checkTextAvailable(_ text: String) -> Bool {
        
        return text.count > 5
    }
}
