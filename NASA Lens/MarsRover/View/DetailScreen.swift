//
//  HomeScreen.swift
//  NASA Lens
//
//  Created by John Motta on 10/10/24.
//

import UIKit
import SDWebImage

class DetailScreen: UIView {
    
    private let scrollView = ScrollDefault()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let imageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    private let imageView = ImageDefault(contentMode: .scaleAspectFill, clipsToBounds: true)
    
    private let titleLabel = LabelDefault(fontSize: 20, fontWeight: .bold, numberOfLines: 0)
    private let descriptionLabel = LabelDefault(fontSize: 16, fontWeight: .regular, numberOfLines: 0)
    private let roverInfoLabel = LabelDefault(fontSize: 16, fontWeight: .regular)
    private let cameraInfoLabel = LabelDefault(fontSize: 16, fontWeight: .regular)
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share Photo", for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        setConstraints()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addElements() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imageContainerView)
        imageContainerView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(roverInfoLabel)
        contentView.addSubview(cameraInfoLabel)
        contentView.addSubview(shareButton)
    }
    
    private func setConstraints() {
        let screenWidth = UIScreen.main.bounds.width
        let imageSize = screenWidth
        let aspectRatio: CGFloat = 4 / 3

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageContainerView.widthAnchor.constraint(equalToConstant: imageSize),
            imageContainerView.heightAnchor.constraint(equalTo: imageContainerView.widthAnchor, multiplier: 1 / aspectRatio),
            
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            roverInfoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            roverInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            roverInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            cameraInfoLabel.topAnchor.constraint(equalTo: roverInfoLabel.bottomAnchor, constant: 5),
            cameraInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cameraInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            shareButton.topAnchor.constraint(equalTo: cameraInfoLabel.bottomAnchor, constant: 20),
            shareButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func configure(with photo: MarsRoverPhoto?) {
        guard let photo = photo else {
            titleLabel.text = "Erro ao carregar dados"
            descriptionLabel.text = "Não foi possível obter informações da foto."
            imageView.image = UIImage(systemName: "exclamationmark.triangle")
            return
        }
        
        titleLabel.text = photo.camera.fullName
        descriptionLabel.text = "Earth Date: \(photo.earthDate)"
        roverInfoLabel.text = "Rover: \(photo.rover.name) - Status: \(photo.rover.status)"
        cameraInfoLabel.text = "Camera: \(photo.camera.name)"
        
        let imageUrlString = photo.imgSrc.replacingOccurrences(of: "http://", with: "https://")
        guard let imageUrl = URL(string: imageUrlString) else {
            print("URL da imagem inválida:", photo.imgSrc)
            imageView.image = UIImage(systemName: "photo")
            return
        }
        
        imageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo")) { [weak self] (image, error, _, _) in
            if let error = error {
                print("Erro ao carregar a imagem:", error.localizedDescription)
                self?.imageView.image = UIImage(systemName: "exclamationmark.triangle")
            }
        }
    }
}
