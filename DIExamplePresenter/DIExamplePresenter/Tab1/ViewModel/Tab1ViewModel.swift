//
//  Tab1ViewModel.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/19/21.
//

import Foundation

public protocol Tab1ViewModelInput {
    
}

public protocol Tab1ViewModelOutput {
    
}

public protocol Tab1ViewModel: Tab1ViewModelInput & Tab1ViewModelOutput, DetailsViewModelResponder {}

public class DefaultTab1ViewModel: Tab1ViewModel {
    
    public init() {
        
    }
}

extension DefaultTab1ViewModel: Tab1ViewModelOutput {
    
}

extension DefaultTab1ViewModel: Tab1ViewModelInput {
    
}

extension DefaultTab1ViewModel: DetailsViewModelResponder {
    
    public func titleDidUpdate() {
        
    }
}
