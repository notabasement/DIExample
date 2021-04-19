//
//  TabViewController.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/18/21.
//

import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration

public class TabViewController: UITabBarController {
    
    private var viewModel: TabViewModel!
    private var container: Container!
    
    public static func create(viewModel: TabViewModel,
                              container: Container) -> Self {
        let storyboard = UIStoryboard(name: "Tab", bundle: Bundle(identifier: "com.lbaovy.DIExamplePresenter"))
        let view = storyboard.instantiateViewController(identifier: "TabViewController") as! Self
        view.viewModel = viewModel
        view.container = container
        return view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let tab1Container = Tab1Container(parent: container)
        let tab2Container = Tab2Container(parent: container)
        
        let tab1Assembler = Assembler(container: tab1Container.container)
        let tab2Assembler = Assembler(container: tab2Container.container)
        
        let vc1 = tab1Assembler.resolver~>(Tab1ViewController.self)
        let vc2 = tab2Assembler.resolver~>(Tab2ViewController.self)
        
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        viewControllers = [vc1, vc2]
    }
}
