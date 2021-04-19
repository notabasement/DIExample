//
//  TitleRepositoryInterface.swift
//  DIExampleDomain
//
//  Created by Vy Le on 4/15/21.
//

import Foundation

public protocol TitleRepository {
    
    func getAllTitles() -> [Title]
    func getTitleDetail(with id: String) -> Title?
    func updateTitle(with id: String, name: String, lastUpdated: Date)
}
