//
//  LabelDefault.swift
//  NASA Lens
//
//  Created by John Motta on 17/10/24.
//

import UIKit

class LabelDefault: UILabel {
    
    init(textColor: UIColor = .label, fontSize: CGFloat, fontWeight: UIFont.Weight, opacity: CGFloat = 1, numberOfLines: Int = 0, textAligment: NSTextAlignment = .natural) {
        super.init(frame: .zero)
        
        self.initDefault(textColor, fontSize, fontWeight, opacity, numberOfLines, textAligment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(_ textColor: UIColor, _ fontSize: CGFloat, _ fontWeight: UIFont.Weight,_ opacity: CGFloat,_ numberOfLines: Int, _ textAligment: NSTextAlignment) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = textColor
        self.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        self.textAlignment = textAligment
        self.alpha = opacity
        self.numberOfLines = numberOfLines
    }
}
