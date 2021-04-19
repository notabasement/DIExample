//
//  Tab2ViewController.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/19/21.
//

import Foundation
import UIKit

public class Tab2ViewController: UIViewController {
    
    private var viewModel: Tab2ViewModel!
    
    public static func create(viewModel: Tab2ViewModel) -> Self {
        let storyboard = UIStoryboard(name: "Tab", bundle: Bundle(identifier: "com.lbaovy.DIExamplePresenter"))
        let view = storyboard.instantiateViewController(identifier: "Tab2ViewController") as! Self
        view.viewModel = viewModel
        return view
    }
}
