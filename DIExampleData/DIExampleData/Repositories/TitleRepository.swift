//
//  TitleRepository.swift
//  DIExampleData
//
//  Created by Vy Le on 4/15/21.
//

import Foundation
import DIExampleDomain

public class DefaultTitleRepository {
    
    private var titles: [Title] = []
    
    public init() {
        titles = [
            Title(id: "1563877936",
                  name: "Campfire Cooking in Another World with My Absurd Skill: Sui's Great Adventure",
                  lastUpdated: Date(timeIntervalSinceReferenceDate: 1563877936)),
            Title(id: "1554028348",
                  name: "Regarding the Display of an Outrageous Skill Which Has Incredible Powers",
                  lastUpdated: Date(timeIntervalSinceReferenceDate: 1554028348)),
            Title(id: "1557743561",
                  name: "A Veterinarian in Another World",
                  lastUpdated: Date(timeIntervalSinceReferenceDate: 1557743561)),
            Title(id: "15755140948",
                  name: "A Returner's Magic Should Be Special",
                  lastUpdated: Date(timeIntervalSinceReferenceDate: 1575540948)),
            Title(id: "15751282398",
                  name: "The Seven Deadly Sins",
                  lastUpdated: Date(timeIntervalSinceReferenceDate: 1575282398)),
            Title(id: "15713813598",
                  name: "My Wife is a Demon Queen",
                  lastUpdated: Date(timeIntervalSinceReferenceDate: 1573813598)),
            Title(id: "15724072798",
                  name: "Tales of Demons and Gods",
                  lastUpdated: Date(timeIntervalSinceReferenceDate: 1574072798)),
            Title(id: "15753534462",
                  name: "Demon Slayer: Kimetsu no Yaiba",
                  lastUpdated: Date(timeIntervalSinceReferenceDate: 1575534462))
        ]
    }
}

extension DefaultTitleRepository: TitleRepository {
    
    public func getAllTitles() -> [Title] {
        titles
    }
    
    public func getTitleDetail(with id: String) -> Title? {
        titles.first(where: { $0.id == id })
    }
    
    public func updateTitle(with id: String, name: String, lastUpdated: Date) {
        guard let index = titles.enumerated().first(where: { $0.element.id == id })?.offset else { return }
        let title = titles[index]
        titles[index] = Title(id: title.id, name: name, lastUpdated: lastUpdated)
    }
}
