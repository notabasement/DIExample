//
//  Chapter.swift
//  DIExampleDomain
//
//  Created by Vy Le on 4/19/21.
//

import Foundation

public struct Chapter {
    
    public let id: String
    public let titleId: String
    public let name: String
    
    public init(id: String, titleId: String, name: String) {
        self.id = id
        self.titleId = titleId
        self.name = name
    }
}
