//
//  AppUpdate.swift
//  MarketFinder
//
//  Created by User on 2021/10/20.
//

import Foundation

enum AppUpdate {
    case optional
    case required
    
    var title:String {
        let title = self == .optional ? "OptionalUpdateTitle" : "RequiredUpdateTitle"
        
        return title.localized
    }
}
