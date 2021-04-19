//
//  ChapterRepository.swift
//  DIExampleData
//
//  Created by Vy Le on 4/19/21.
//

import Foundation
import DIExampleDomain

public class DefaultChapterRepository {
    
    private var chapters: [Chapter] = []
    
    public init() {
        chapters = [
            Chapter(id: "1",
                    titleId: "1563877936",
                    name: "Chapter 1"),
            Chapter(id: "2",
                    titleId: "1563877936",
                    name: "Chapter 2"),
            Chapter(id: "3",
                    titleId: "1563877936",
                    name: "Chapter 3"),
            Chapter(id: "4",
                    titleId: "1563877936",
                    name: "Chapter 4"),
            Chapter(id: "5",
                    titleId: "1554028348",
                    name: "Chapter 1"),
            Chapter(id: "6",
                    titleId: "1554028348",
                    name: "Chapter 2"),
            Chapter(id: "7",
                    titleId: "1557743561",
                    name: "Chapter 1"),
            Chapter(id: "8",
                    titleId: "1557743561",
                    name: "Chapter 2"),
            Chapter(id: "9",
                    titleId: "1557743561",
                    name: "Chapter 3"),
            Chapter(id: "10",
                    titleId: "15755140948",
                    name: "Chapter 1")
        ]
    }
}

extension DefaultChapterRepository: ChapterRepository {
    
    public func getChapterList(with titleId: String) -> [Chapter] {
        chapters.filter({ $0.titleId == titleId })
    }
}

