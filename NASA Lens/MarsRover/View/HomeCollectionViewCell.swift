//
//  HomeCollectionViewCell.swift
//  NASA Lens
//
//  Created by John Motta on 16/10/24.
//

import UIKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: HomeCollectionViewCell.self)
    
    private let photoImageView = ImageDefault(contentMode: .scaleAspectFill, clipsToBounds: true)
    
    private let titleBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    private let titleLabel = LabelDefault(textColor: .white, fontSize: 14, fontWeight: .bold, numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(titleBackgroundView)
        contentView.addSubview(titleLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: titleBackgroundView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: titleBackgroundView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: titleBackgroundView.trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: titleBackgroundView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with photo: MarsRoverPhoto) {
        let imageUrlString = photo.imgSrc.replacingOccurrences(of: "http://", with: "https://")
        if let imageUrl = URL(string: imageUrlString) {
            photoImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"))
        } else {
            print("URL da imagem inválida:", photo.imgSrc)
        }
        titleLabel.text = photo.camera.fullName
    }
}
