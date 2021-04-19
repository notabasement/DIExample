//
//  MainViewModel.swift
//  DIExample
//
//  Created by Vy Le on 4/16/21.
//

import Foundation

public protocol MainViewModelInput {
    
}

public protocol MainViewModelOutput {
    
}

public protocol MainViewModel: MainViewModelInput & MainViewModelOutput {}

public class DefaultMainViewModel: MainViewModel {
    
    public init() {
        
    }
}

extension DefaultMainViewModel: MainViewModelOutput {
    
}

extension DefaultMainViewModel: MainViewModelInput {
    
}
