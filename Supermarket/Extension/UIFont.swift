//
//  UIFont.swift
//  Supermarket
//
//  Created by User on 2020/06/28.
//

import UIKit

extension UIFont {
    static func loadFont(fontName: Font) -> UIFont {
        return self.loadFont(fontName: fontName, fontSize: 15)
    }
    
    static func loadFont(fontName: Font, fontSize: CGFloat) -> UIFont {
        return UIFont(name: fontName.rawValue, size: 15) ?? UIFont()
    }
}
