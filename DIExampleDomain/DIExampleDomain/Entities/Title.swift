//
//  Title.swift
//  DIExampleDomain
//
//  Created by Vy Le on 4/15/21.
//

import Foundation

public struct Title {
    
    public let id: String
    public let name: String
    public let lastUpdated: Date
    
    public init(id: String, name: String, lastUpdated: Date) {
        self.id = id
        self.name = name
        self.lastUpdated = lastUpdated
    }
}
