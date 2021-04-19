//
//  ChapterAssembly.swift
//  DIExample
//
//  Created by Vy Le on 4/19/21.
//

import Foundation
import DIExampleDomain
import DIExampleData
import Swinject
import SwinjectAutoregistration

public class ChapterAssembly: Assembly {
    
    public func assemble(container: Container) {
        container.autoregister(ChapterRepository.self, initializer: DefaultChapterRepository.init).inObjectScope(.container)
        
        container.autoregister(GetChapterListUseCase.self, initializer: DefaultGetChapterListUseCase.init)
    }
}
