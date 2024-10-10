//
//  HomeTableViewCell.swift
//  NASA Lens
//
//  Created by John Motta on 10/10/24.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {

    static let identifier = String(describing: HomeTableViewCell.self)
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(titleLabel)
    }
    
    private func configConstraints() {
        photoImageView.contentMode = .scaleAspectFill 
        let imageConstraints = [
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            photoImageView.heightAnchor.constraint(equalToConstant: 150),
//            photoImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ]
                
        NSLayoutConstraint.activate(imageConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    func configure(with photo: MarsRoverPhoto) {
        let imageUrlString = photo.imgSrc.replacingOccurrences(of: "http://", with: "https://")
        if let imageUrl = URL(string: imageUrlString) {
            print("Carregando imagem: \(imageUrl)")
            photoImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"))
        } else {
            print("URL da imagem inválida:", photo.imgSrc)
        }

        titleLabel.text = photo.camera.fullName
    }
}

