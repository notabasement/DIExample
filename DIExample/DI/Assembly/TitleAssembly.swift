//
//  TitleAssembly.swift
//  DIExample
//
//  Created by Vy Le on 4/15/21.
//

import Foundation
import DIExampleDomain
import DIExampleData
import Swinject
import SwinjectAutoregistration

public class TitleAssembly: Assembly {
    
    public func assemble(container: Container) {
        container.autoregister(TitleRepository.self, initializer: DefaultTitleRepository.init).inObjectScope(.container)
        
        container.autoregister(GetTitlesUseCase.self, initializer: DefaultGetTitlesUseCase.init)
        container.autoregister(UpdateTitleUseCase.self, initializer: DefaultUpdateTitleUseCase.init)
        container.autoregister(GetTitleDetailUseCase.self, initializer: DefaultGetTitleDetailUseCase.init)
    }
}
