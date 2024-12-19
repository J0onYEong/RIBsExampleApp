//
//  public.swift
//  RibsTest
//
//  Created by choijunios on 12/19/24.
//

import RIBs
import RxSwift

// 상위 Rib의 컴포넌트가 conform
public protocol TextEditDependency: Dependency {
    
    var initialText: String { get }
}


// 상위 Rib의 인터렉터가 conform
public protocol TextEditListener: AnyObject {
    
    
}
