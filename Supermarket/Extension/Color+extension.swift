//
//  Color.swift
//  Supermarket
//
//  Created by User on 2020/08/05.
//

import UIKit

enum Color: String {
    case white = "white"
}

extension UIColor {
    static func color(color:Color) -> UIColor {
        return UIColor(named: color.rawValue) ?? UIColor()
    }
}
