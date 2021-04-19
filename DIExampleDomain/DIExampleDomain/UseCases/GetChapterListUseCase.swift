//
//  GetChapterListUseCase.swift
//  DIExampleDomain
//
//  Created by Vy Le on 4/19/21.
//

import Foundation

public protocol GetChapterListUseCase {
    
    func execute(with id: String) -> [Chapter]
}

public class DefaultGetChapterListUseCase {
    
    private let repository: ChapterRepository
    
    public init(repository: ChapterRepository) {
        self.repository = repository
    }
}

extension DefaultGetChapterListUseCase: GetChapterListUseCase {
    
    public func execute(with id: String) -> [Chapter] {
        repository.getChapterList(with: id)
    }
}
