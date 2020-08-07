//
//  Market.swift
//  Supermarket
//
//  Created by User on 2020/06/28.
//

import Foundation

struct MartBrand:Decodable {
    let brand:String
    let market:[Market]
}

struct Market:Decodable {
    let name:String
    let name_en:String
    let location:Location
}

struct Location:Decodable {
    let lat:Double
    let lng:Double
}
