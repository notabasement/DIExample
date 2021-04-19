//
//  GetTitlesUseCase.swift
//  DIExampleDomain
//
//  Created by Vy Le on 4/15/21.
//

import Foundation

public protocol GetTitlesUseCase {
    
    func execute() -> [Title]
}

public class DefaultGetTitlesUseCase {
    
    private let repository: TitleRepository
    
    public init(repository: TitleRepository) {
        self.repository = repository
    }
}

extension DefaultGetTitlesUseCase: GetTitlesUseCase {
    
    public func execute() -> [Title] {
        repository.getAllTitles()
    }
}
