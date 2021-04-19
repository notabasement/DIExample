//
//  ChapterRepositoryInterfaces.swift
//  DIExampleDomain
//
//  Created by Vy Le on 4/19/21.
//

import Foundation

public protocol ChapterRepository {
    
    func getChapterList(with titleId: String) -> [Chapter]
}
