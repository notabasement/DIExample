//
//  GetTitleDetailUseCase.swift
//  DIExampleDomain
//
//  Created by Vy Le on 4/19/21.
//

import Foundation

public protocol GetTitleDetailUseCase {
    
    func execute(with id: String) -> Title?
}

public class DefaultGetTitleDetailUseCase {
    
    private let repository: TitleRepository
    
    public init(repository: TitleRepository) {
        self.repository = repository
    }
}

extension DefaultGetTitleDetailUseCase: GetTitleDetailUseCase {
    
    public func execute(with id: String) -> Title? {
        repository.getTitleDetail(with: id)
    }
}
