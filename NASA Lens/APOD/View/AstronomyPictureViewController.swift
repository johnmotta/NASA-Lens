//
//  AstronomyPictureViewController.swift
//  NASA Lens
//
//  Created by John Motta on 13/10/24.
//

import UIKit
import SDWebImage

class AstronomyPictureViewController: UIViewController {
    
    var astronomyPictureScreen = AstronomyPictureScreen()
    let viewModel = AstronomyPictureViewModel()
    
    override func loadView() {
        view = astronomyPictureScreen
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = true
        viewModel.loadAstronomyPictures()
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.onDataUpdated = { [weak self] in
            self?.astronomyPictureScreen.updateView(viewModel: self?.viewModel)
        }
        
        viewModel.onError = { [weak self] error in
            self?.showError(error)
        }
    }
    
    private func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
