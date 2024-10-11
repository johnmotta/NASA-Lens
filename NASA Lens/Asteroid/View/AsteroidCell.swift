//
//  AsteroidCell.swift
//  NASA Lens
//
//  Created by John Motta on 11/10/24.
//

import UIKit

class AsteroidCell: UITableViewCell {
    
    private let nameLabel:  UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let approachDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let velocityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let diameterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let hazardousIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "exclamationmark.triangle.fill")
        image.tintColor = .red
        image.isHidden = true
        return image
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, approachDateLabel, velocityLabel, diameterLabel, hazardousIcon])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        contentView.addSubview(stackView)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func configure(with asteroid: NearEarthObject) {
        nameLabel.text = asteroid.name
        if let approachData = asteroid.closeApproachData.first {
            approachDateLabel.text = "Approach Date: \(approachData.closeApproachDate)"
            velocityLabel.text = "Velocity: \(approachData.relativeVelocity.kilometersPerHour) km/h"
            diameterLabel.text = "Diameter: \(asteroid.estimatedDiameter.kilometers.estimatedDiameterMin)-\(asteroid.estimatedDiameter.kilometers.estimatedDiameterMax) km"
        }
        hazardousIcon.isHidden = !asteroid.isPotentiallyHazardousAsteroid
    }
}
