//
//  ImageDefault.swift
//  NASA Lens
//
//  Created by John Motta on 17/10/24.
//

import UIKit

class ImageDefault: UIImageView {
    
    init(contentMode: UIView.ContentMode) {
        super.init(frame: .zero)
        
        initDefault(contentMode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(_ contentMode: UIView.ContentMode) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = contentMode
    }
}
