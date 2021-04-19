//
//  RegistrationManager.swift
//  DIExample
//
//  Created by Vy Le on 4/19/21.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import DIExamplePresenter

extension RegistrationManager {
    
    public static func setupContainers() {
        RegistrationManager.containers[.main] = { container in
            container.autoregister(MainViewModel.self, initializer: DefaultMainViewModel.init).inObjectScope(.container)
            container.register(MainViewController.self) { (resolver: Resolver) -> MainViewController in
                MainViewController.create(viewModel: resolver~>,
                                          container: container)
            }.inObjectScope(.container)
        }
        
        RegistrationManager.containers[.home] = { container in
            container.register(DetailsViewModelResponder.self) { $0~>HomeViewModel.self }
            container.autoregister(HomeViewModel.self, initializer: DefaultHomeViewModel.init).inObjectScope(.container)
            container.register(HomeViewController.self) { (resolver: Resolver) -> HomeViewController in
                HomeViewController.create(viewModel: resolver~>,
                                          container: container)
            }
        }
        
        RegistrationManager.containers[.details] = { container in
            container.autoregister(DetailsViewModel.self, argument: String.self, initializer: DefaultDetailsViewModel.init)
            container.register(DetailsViewController.self) { (resolver: Resolver, id: String) -> DetailsViewController in
                DetailsViewController.create(viewModel: resolver~>(DetailsViewModel.self, argument: id),
                                             container: container)
            }
        }
        
        RegistrationManager.containers[.blank] = { container in
            container.autoregister(BlankViewModel.self, initializer: DefaultBlankViewModel.init)
            container.autoregister(BlankViewController.self, initializer: BlankViewController.create)
        }
        
        RegistrationManager.containers[.tab] = { container in
            container.autoregister(TabViewModel.self, initializer: DefaultTabViewModel.init)
            container.autoregister(TabViewController.self, initializer: TabViewController.create)
            container.register(TabViewController.self) { resolver -> TabViewController in
                TabViewController.create(viewModel: resolver~>,
                                         container: container)
            }
        }
        
        RegistrationManager.containers[.tab1] = { container in
            container.register(DetailsViewModelResponder.self) { $0~>Tab1ViewModel.self }
            container.autoregister(Tab1ViewModel.self, initializer: DefaultTab1ViewModel.init)
            
            container.register(Tab1ViewController.self) { resolver -> Tab1ViewController in
                Tab1ViewController.create(viewModel: resolver~>,
                                          container: container)
            }
        }
        
        RegistrationManager.containers[.tab2] = { container in
            container.autoregister(Tab2ViewModel.self, initializer: DefaultTab2ViewModel.init)
            container.autoregister(Tab2ViewController.self, initializer: Tab2ViewController.create)
        }
    }
    
    public static func setupAssemblies() {
        RegistrationManager.assemblies[.title] = TitleAssembly()
        RegistrationManager.assemblies[.chapter] = ChapterAssembly()
    }
}
