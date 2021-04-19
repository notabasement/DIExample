//
//  TabContainer.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/19/21.
//

import Foundation
import Swinject

public class TabContainer {
    
    public let parent: Container
    public let container: Container
    
    public init(parent: Container) {
        self.parent = parent
        if let closure = RegistrationManager.containers[.tab] {
            self.container =  Container(parent: parent, registeringClosure: closure)
        } else {
            self.container = Container(parent: parent)
        }
    }
}
