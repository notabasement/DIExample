//
//  Tab1ViewController.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/19/21.
//

import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration

public class Tab1ViewController: UIViewController {
    
    private var viewModel: Tab1ViewModel!
    private var container: Container!
    
    public static func create(viewModel: Tab1ViewModel,
                              container: Container) -> Self {
        let storyboard = UIStoryboard(name: "Tab", bundle: Bundle(identifier: "com.lbaovy.DIExamplePresenter"))
        let view = storyboard.instantiateViewController(identifier: "Tab1ViewController") as! Self
        view.viewModel = viewModel
        view.container = container
        return view
    }
    
    @IBAction func openTitleDetails() {
        guard let titleAssembly = RegistrationManager.assemblies[.title],
              let chapterAssembly = RegistrationManager.assemblies[.chapter] else { return }
        let detailsContainer = DetailsContainer(parent: container)
        let assembler = Assembler([titleAssembly, chapterAssembly], container: detailsContainer.container)
        let vc = assembler.resolver~>(DetailsViewController.self, argument: "15751282398")
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true, completion: nil)
    }
}
