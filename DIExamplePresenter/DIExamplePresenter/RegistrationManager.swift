//
//  RegistrationManager.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/19/21.
//

import Foundation
import Swinject

public class RegistrationManager {
    
    public static var containers = [ContainerType: ((Container) -> Void)]()
    public static var assemblies = [AssemblyType: Assembly]()
}
