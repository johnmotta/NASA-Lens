//
//  AstronomyPictureScreen.swift
//  NASA Lens
//
//  Created by John Motta on 16/10/24.
//

import UIKit

class AstronomyPictureScreen: UIView {
    
    let descriptionScrollView = ScrollDefault()
    
    let titleLabel = LabelDefault(fontSize: 20, fontWeight: .bold, textAligment: .center)
    let descriptionLabel = LabelDefault(fontSize: 16, fontWeight: .light, numberOfLines: 0, textAligment: .justified)
    
    let imageView = ImageDefault(contentMode: .scaleAspectFill)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(imageView)
        addSubview(descriptionScrollView)
        descriptionScrollView.addSubview(descriptionLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            descriptionScrollView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptionScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionScrollView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionScrollView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionScrollView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionScrollView.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: descriptionScrollView.widthAnchor)
        ])
    }
    
    func updateView(viewModel: AstronomyPictureViewModel?) {
        guard let astronomyPicture = viewModel?.astronomyPicture else {
            print("Sem dados para exibir")
            return
        }
        
        titleLabel.text = astronomyPicture.title
        descriptionLabel.text = astronomyPicture.explanation
        
        let imageUrlString = astronomyPicture.url.replacingOccurrences(of: "http://", with: "https://")
        if let imageUrl = URL(string: imageUrlString) {
            imageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"))
        } else {
            print("URL inválida: \(imageUrlString)")
        }
    }
}
