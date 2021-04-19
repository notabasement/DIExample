//
//  TabViewModel.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/18/21.
//

import Foundation

public protocol TabViewModelInput {
    
}

public protocol TabViewModelOutput {
    
}

public protocol TabViewModel: TabViewModelInput & TabViewModelOutput {}

public class DefaultTabViewModel: TabViewModel {
    
    public init() {
        
    }
}

extension DefaultTabViewModel: TabViewModelOutput {
    
}

extension DefaultTabViewModel: TabViewModelInput {
    
}
