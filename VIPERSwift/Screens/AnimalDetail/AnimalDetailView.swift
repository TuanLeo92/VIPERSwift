//
//  AnimalDetailView.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalDetailView: UIViewController {
    
    @IBOutlet weak var bigImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalDescriptionLabel: UILabel!
    
    weak var presenter: AnimalDetailPresenterType?
    
    var animal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAnimalDetailPresenter(self)
        
        bigImageView.layer.cornerRadius = bigImageView.frame.width / 2.0
        bigImageView.clipsToBounds = true
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    deinit {
        logDeinit()
    }
}

extension AnimalDetailView: AnimalDetailViewType {
    func createAnimalDetailPresenter(_ referenceView: AnimalDetailView) {
        let presenter = AnimalDetailPresenter()
        referenceView.presenter = presenter
        referenceView.presenter?.router = AnimalDetailRouter()
        referenceView.presenter?.view = referenceView
        referenceView.presenter?.interactor = AnimalDetailInteractor()
        referenceView.presenter?.interactor.presenter = presenter
        referenceView.presenter?.interactor.repository = AnimalDetailRepository()
    }
    
    func showAnimalDetail() {
        guard let animal = animal else {
            return
        }
        
        if let image = animal.image {
            bigImageView.image = UIImage(named: image)
        }
        animalNameLabel.text = animal.name
        animalDescriptionLabel.text = animal.description
    }
}


// MARK: - Actions
extension AnimalDetailView {
    @IBAction private func backAction(_ sender: UIButton) {
        presenter?.router?.backToAnimalListScreen(from: navigationController)
    }
}
