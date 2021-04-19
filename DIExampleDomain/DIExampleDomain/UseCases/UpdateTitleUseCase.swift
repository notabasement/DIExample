//
//  UpdateTitleUseCase.swift
//  DIExampleDomain
//
//  Created by Vy Le on 4/16/21.
//

import Foundation

public protocol UpdateTitleUseCase {
    
    func execute(id: String, name: String, lastUpdated: Date)
}

public class DefaultUpdateTitleUseCase {
    
    private let titleRepository: TitleRepository
    
    public init(titleRepository: TitleRepository) {
        self.titleRepository = titleRepository
    }
}

extension DefaultUpdateTitleUseCase: UpdateTitleUseCase {
    
    public func execute(id: String, name: String, lastUpdated: Date) {
        titleRepository.updateTitle(with: id, name: name, lastUpdated: lastUpdated)
    }
}
