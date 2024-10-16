//
//  AstronomyPictureScreen.swift
//  NASA Lens
//
//  Created by John Motta on 16/10/24.
//

import UIKit

class AstronomyPictureScreen: UIView {
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        scroll.backgroundColor = .systemBackground
        scroll.frame = UIScreen.main.bounds
        return scroll
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.sizeToFit()
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(imageView)
        containerView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
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
