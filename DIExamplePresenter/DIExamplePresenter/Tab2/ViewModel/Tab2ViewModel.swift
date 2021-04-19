//
//  Tab2ViewModel.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/19/21.
//

import Foundation

public protocol Tab2ViewModelInput {
    
}

public protocol Tab2ViewModelOutput {
    
}

public protocol Tab2ViewModel: Tab2ViewModelInput & Tab2ViewModelOutput {}

public class DefaultTab2ViewModel: Tab2ViewModel {
    
    public init() {
        
    }
}

extension DefaultTab2ViewModel: Tab2ViewModelOutput {
    
}

extension DefaultTab2ViewModel: Tab2ViewModelInput {
    
}
