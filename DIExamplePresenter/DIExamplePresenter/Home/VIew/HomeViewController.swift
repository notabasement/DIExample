//
//  ViewController.swift
//  DIExample
//
//  Created by Vy Le on 4/15/21.
//

import UIKit
import Swinject
import SwinjectAutoregistration

public class HomeViewController: UITableViewController {
    
    private var viewModel: HomeViewModel!
    private var container: Container!
    
    public static func create(viewModel: HomeViewModel,
                              container: Container) -> Self {
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle(identifier: "com.lbaovy.DIExamplePresenter"))
        let view = storyboard.instantiateViewController(identifier: "HomeViewController") as! Self
        view.viewModel = viewModel
        view.container = container
        return view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTable), name: NSNotification.Name.ReloadTableView, object: nil)
    }
    
    @objc func refreshTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel.items[indexPath.item].name
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let chapterAssembly = RegistrationManager.assemblies[.chapter] else { return }
        let detailsContainer = DetailsContainer(parent: container)
        let assembler = Assembler([chapterAssembly], container: detailsContainer.container)
        let vc = assembler.resolver~>(DetailsViewController.self, argument: viewModel.items[indexPath.item].id)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

extension NSNotification.Name {

    public static let ReloadTableView = Notification.Name("ReloadTableView")
}
