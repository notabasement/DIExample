//
//  HomeViewModel.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/15/21.
//

import Foundation
import DIExampleDomain

public protocol HomeViewModelInput {
    
}

public protocol HomeViewModelOutput {
    
    var items: [Title] { get }
}

public protocol HomeViewModel: HomeViewModelInput & HomeViewModelOutput, DetailsViewModelResponder {}

public class DefaultHomeViewModel: HomeViewModel {
    
    public var items: [Title]
    private let getTitlesUseCase: GetTitlesUseCase
    
    public init(getTitlesUseCase: GetTitlesUseCase) {
        self.getTitlesUseCase = getTitlesUseCase
        self.items = getTitlesUseCase.execute()
    }
}

extension DefaultHomeViewModel: HomeViewModelOutput {
    
}

extension DefaultHomeViewModel: HomeViewModelInput {
    
}

extension DefaultHomeViewModel: DetailsViewModelResponder {
    
    public func titleDidUpdate() {
        items = getTitlesUseCase.execute()
        NotificationCenter.default.post(name: NSNotification.Name.ReloadTableView, object: nil)
    }
}
