//
//  BlankViewModel.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/16/21.
//

import Foundation

public protocol BlankViewModelInput {
    
}

public protocol BlankViewModelOutput {
    
}

public protocol BlankViewModel: BlankViewModelInput & BlankViewModelOutput {}

public class DefaultBlankViewModel: BlankViewModel {
    
    public init() {
        
    }
}

extension DefaultBlankViewModel: BlankViewModelOutput {
    
}

extension DefaultBlankViewModel: BlankViewModelInput {
    
}
