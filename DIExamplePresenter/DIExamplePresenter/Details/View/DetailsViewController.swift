//
//  DetailsViewController.swift
//  DIExamplePresenter
//
//  Created by Vy Le on 4/15/21.
//

import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration

public class DetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    @IBOutlet weak var numChaptersLabel: UILabel!
    
    private var viewModel: DetailsViewModel!
    private var container: Container!
    
    private let formatter = DateFormatter()
    
    public static func create(viewModel: DetailsViewModel,
                              container: Container) -> Self {
        let storyboard = UIStoryboard(name: "Details", bundle: Bundle(identifier: "com.lbaovy.DIExamplePresenter"))
        let view = storyboard.instantiateViewController(identifier: "DetailsViewController") as! Self
        view.viewModel = viewModel
        view.container = container
        return view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        titleLabel.text = viewModel.item.name
        lastUpdatedLabel.text = formatter.string(from: viewModel.item.lastUpdated)
        numChaptersLabel.text = "Number of chapters: \(viewModel.numChapters)"
    }
    
    @IBAction func showDialog() {
        let alertVC = UIAlertController(title: "Rename", message: nil, preferredStyle: .alert)
        alertVC.addTextField(configurationHandler: nil)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            guard let self = self,
                  let name = alertVC.textFields?.first?.text else { return }
            let updatedDate = Date()
            self.titleLabel.text = name
            self.lastUpdatedLabel.text = self.formatter.string(from: updatedDate)
            self.viewModel.updateTitle(with: name, lastUpdated: updatedDate)
        }))
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func openBlankView() {
        let blankContainer = BlankContainer(parent: container)
        let assembler = Assembler(container: blankContainer.container)
        let vc = assembler.resolver~>(BlankViewController.self)
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true, completion: nil)
    }
}
