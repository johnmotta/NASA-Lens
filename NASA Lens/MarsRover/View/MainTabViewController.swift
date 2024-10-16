//
//  MainTabViewController.swift
//  NASA Lens
//
//  Created by John Motta on 11/10/24.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .label

        let astronomyPictureVC = UINavigationController(rootViewController: AstronomyPictureViewController())
        astronomyPictureVC.tabBarItem.image = UIImage(systemName: "photo.artframe")
        astronomyPictureVC.title = "Photo of the day"
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.image = UIImage(systemName: "circle.grid.cross.fill")
        homeVC.title = "Views of Mars"
        
        let asteroidVC = UINavigationController(rootViewController: AsteroidViewController())
        asteroidVC.tabBarItem.image = UIImage(systemName: "network")
        asteroidVC.title = "Near-Earth Asteroids"

        setViewControllers([astronomyPictureVC, homeVC, asteroidVC], animated: true)
    }
}
