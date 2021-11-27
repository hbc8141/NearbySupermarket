//
//  Color.swift
//  MarketFinder
//
//  Created by User on 2021/10/15.
//

import UIKit

enum Color: String {
    case accentColor = "AccentColor"
    case whiteTextColor = "WhiteTextColor"
    case blackTextColor = "BlackTextColor"
    
    var color:UIColor {
        return UIColor(named: self.rawValue) ?? UIColor()
    }
}

extension UIColor {
    
    // 기본 색상
    class var accentColor:UIColor {
        return Color.accentColor.color
    }
    
    // 버튼 글자색
    class var whiteTextColor:UIColor {
        return Color.whiteTextColor.color
    }
    
    // 버튼 글자색(검정)
    class var blackTextColor:UIColor {
        return Color.blackTextColor.color
    }
}
