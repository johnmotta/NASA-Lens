//
//  DetailViewController.swift
//  NASA Lens
//
//  Created by John Motta on 10/10/24.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var detailScreen: DetailScreen?
    
    override func loadView() {
        detailScreen = DetailScreen()
        view = detailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    func configure(with photo: MarsRoverPhoto) {
        detailScreen?.titleLabel.text = photo.camera.fullName
        detailScreen?.descriptionLabel.text = photo.earthDate
        let imageUrlString = photo.imgSrc.replacingOccurrences(of: "http://", with: "https://")
        if let imageUrl = URL(string: imageUrlString) {
            print("Carregando imagem: \(imageUrl)")
            detailScreen?.imageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"))
        } else {
            print("URL da imagem inválida:", photo.imgSrc)
        }
    }
}
