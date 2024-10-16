//
//  DetailViewController.swift
//  NASA Lens
//
//  Created by John Motta on 10/10/24.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var detailScreen = DetailScreen()
    
    override func loadView() {
        view = detailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    func configure(with photo: MarsRoverPhoto) {
        detailScreen.configure(with: photo)
    }
}
