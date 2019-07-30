//
//  AnimalDetailView.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalDetailsScreenView: BaseViewController {
    
    @IBOutlet weak var bigImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalDescriptionLabel: UILabel!
    
    weak var presenter: AnimalDetailsPresenterType?
    
    var animal: Animal = Animal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPresenter()

        presenter?.savePassedAnimal(animal)
        presenter?.fetchMoreInfoOfAnimal(animalId: animal.id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - AnimalDetailsViewType
extension AnimalDetailsScreenView: AnimalDetailsViewType {
    
    func createPresenter() {
        let presenter = AnimalDetailsPresenter()
        presenter.view = self
        presenter.interactor = AnimalDetailsInteractor()
        presenter.interactor.presenter = presenter
        presenter.interactor.repository = AnimalDetailsRepository()
        presenter.router = AnimalDetailsRouter()
        presenter.router.presenter = presenter
        presenter.router.navigationController = navigationController
        self.presenter = presenter
    }
    
    func displayAnimalDetails(_ animal: Animal) {
        if let image = animal.image {
            bigImageView.image = UIImage(named: image)
        }
        animalNameLabel.text = animal.name
        animalDescriptionLabel.text = animal.description
    }
}


// MARK: - Actions
extension AnimalDetailsScreenView {
    
    @IBAction private func backAction(_ sender: UIButton) {
        presenter?.backToPreviousScreen()
    }
}
