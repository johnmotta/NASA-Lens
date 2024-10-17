//
//  ScrollDefault.swift
//  NASA Lens
//
//  Created by John Motta on 17/10/24.
//

import UIKit

class ScrollDefault: UIScrollView {
    
    init(backgroundColor: UIColor = .systemBackground) {
        super.init(frame: .zero)
        
        defaultInit(backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func defaultInit(_ backgroundColor: UIColor) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
    }
}
