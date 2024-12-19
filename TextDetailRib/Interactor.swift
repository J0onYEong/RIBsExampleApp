//
//  Interactor.swift
//  RibsTest
//
//  Created by choijunios on 12/18/24.
//

import RIBs
import RxSwift

class TextDetailInteractor:
    PresentableInteractor<TextDetailPresentable>,
    TextDetailInteractable,
    TextDetailPresenterListener
{
    weak var router: TextDetailRouting?
    weak var listener: TextDetailListener?
    
    private let textPublisher: PublishSubject<String> = .init()
    private(set) lazy var textForDisplay: Observable<String> = textPublisher.asObservable()
    private let disposeBag: DisposeBag = .init()
    
    init(
        presenter: TextDetailPresentable,
        listener: TextDetailListener
    ) {
        
        self.listener = listener
        
        super.init(presenter: presenter)
        
        // bind listener
        listener
            .textForDisplay
            .bind(to: self.textPublisher)
            .disposed(by: disposeBag)
    }
    
    override func didBecomeActive() {
        super.didBecomeActive()
        
        bindPresenter()
        presenter.bind(listener: self)
    }
    
    private func bindPresenter() {
        
        presenter
            .closeButtonClicked
            .withUnretained(self)
            .subscribe(onNext: { interactor, _ in
                
                // pop screen
                interactor.listener?.detachTextDetailRib()
            })
            .disposed(by: disposeBag)
    }
}
