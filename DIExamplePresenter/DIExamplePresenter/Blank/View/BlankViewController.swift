//
//  BlankViewController.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/16/21.
//

import Foundation
import UIKit

public class BlankViewController: UIViewController {
    
    private var viewModel: BlankViewModel!
    
    public static func create(viewModel: BlankViewModel) -> Self {
        let storyboard = UIStoryboard(name: "Blank", bundle: Bundle(identifier: "com.lbaovy.DIExamplePresenter"))
        let view = storyboard.instantiateViewController(identifier: "BlankViewController") as! Self
        view.viewModel = viewModel
        return view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
