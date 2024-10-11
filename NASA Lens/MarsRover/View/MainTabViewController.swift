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

        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.image = UIImage(systemName: "circle.grid.cross.fill")
        homeVC.title = "Mars Rover Photos"
        
        
        
        setViewControllers([homeVC], animated: true)
    }
}
