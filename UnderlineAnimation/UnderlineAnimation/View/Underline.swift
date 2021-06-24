//
//  Underline.swift
//  UnderlineAnimation
//
//  Created by soyeon on 2021/06/24.
//

import UIKit

class Underline: UIView {
    
    // MARK: - Types
    
    struct Constants {
        struct ColorPalette {
            static let green = UIColor(red:0.00, green:0.87, blue:0.71, alpha:1.0)
        }
    }

    // MARK: - View Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    func setConfigure() {
        self.backgroundColor = Constants.ColorPalette.green
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
