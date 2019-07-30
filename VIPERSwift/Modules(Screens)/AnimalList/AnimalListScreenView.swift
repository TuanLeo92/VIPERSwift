//
//  AnimalListScreenView.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalListScreenView: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var presenter: AnimalListPresenterType?
    
    var animals: [Animal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Always is fistly command line
        createPresenter()
        
        self.title = ScreenName.animals
        configTableView()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont(name: "Chalkboard SE", size: 25) ?? .systemFont(ofSize: 25),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationItem.titleView = nil
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.registerNib(cellName: AnimalCell.className)
        tableView.tableFooterView = UIView()
    }
    
    deinit {
        logDeinit()
    }
}

// MARK: - AnimalListViewType
extension AnimalListScreenView: AnimalListViewType {

    func createPresenter() {
        let presenter = AnimalListPresenter()
        presenter.view = self
        presenter.interactor = AnimalListInteractor()
        presenter.interactor.presenter = presenter
        presenter.interactor.repository = AnimalListRepository()
        presenter.router = AnimalListRouter()
        presenter.router.presenter = presenter
        presenter.router.navigationController = navigationController
        self.presenter = presenter
    }
    
    func displayAnimalList(_ animals: [Animal]) {
        self.animals = animals
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension AnimalListScreenView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if 0..<animals.count ~= indexPath.row {
            presenter?.goToAnimalDetail(with: animals[indexPath.row])
        }
    }
}

// MARK: - UITableViewDataSource
extension AnimalListScreenView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: AnimalCell.self, for: indexPath)
        if 0..<animals.count ~= indexPath.row {
            cell.animal = animals[indexPath.row]
        }
        
        return cell
    }
}
