//
//  Public.swift
//  RibsTest
//
//  Created by choijunios on 12/19/24.
//

import RIBs
import RxSwift

public protocol TextDetailDependency: Dependency {
       
    
}

public protocol TextDetailListener: AnyObject {
    
    var textForDisplay: Observable<String> { get }
    
    func detachTextDetailRib()
}
public protocol TextDetailRouting: ViewableRouting { }

public protocol TextDetailBuildable {
    
    func build(withListener listener: TextDetailListener) -> TextDetailRouting
}
