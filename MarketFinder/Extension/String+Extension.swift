//
//  String+Extension.swift
//  MarketFinder
//
//  Created by User on 2021/10/18.
//

import Foundation

// 다국어 작업
extension String {
    
    // 단말기 언어에 맞게끔 반환(연산프로퍼티 사용)
    var localized:String {
        return NSLocalizedString(self, tableName: "Localizable", value: self, comment: "")
    }
}
