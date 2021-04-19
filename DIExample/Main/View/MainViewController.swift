//
//  MainViewController.swift
//  DIExample
//
//  Created by Vy Le on 4/16/21.
//

import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration
import DIExamplePresenter

public class MainViewController: UIViewController {
    
    private var viewModel: MainViewModel!
    private var container: Container!
    
    public static func create(viewModel: MainViewModel,
                              container: Container) -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(identifier: "MainViewController") as! Self
        view.viewModel = viewModel
        view.container = container
        return view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openHome() {
        guard let titleAssembly = RegistrationManager.assemblies[.title] else { return }
        let homeContainer = HomeContainer(parent: container)
        let assembler = Assembler([titleAssembly], container: homeContainer.container)
        let vc = assembler.resolver~>(HomeViewController.self)
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true, completion: nil)
    }
    
    @IBAction func openTab() {
        let tabContainer = TabContainer(parent: container)
        let assembler = Assembler(container: tabContainer.container)
        let vc = assembler.resolver~>(TabViewController.self)
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true, completion: nil)
    }
}
