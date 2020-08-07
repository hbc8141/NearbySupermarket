//
//  Manager.swift
//  Supermarket
//
//  Created by User on 2020/06/28.
//

import UIKit
import RxSwift
import RxCocoa

class MarketManager {
    static let shared:MarketManager = MarketManager()
    
    private let jsonFileName:String = "MarketList"
    
    lazy var marketList:BehaviorSubject<[MartBrand]> = BehaviorSubject<[MartBrand]>(value: self.loadToMarketList())
    
    init() {}
    
    func loadToMarketList() -> [MartBrand] {
        guard let assets:NSDataAsset = NSDataAsset(name: self.jsonFileName) else { return [] }
        
        do {
            let decoder:JSONDecoder = JSONDecoder()
            
            let martBrands:[MartBrand] = try decoder.decode([MartBrand].self, from: assets.data)

            return martBrands
        } catch {
            print(error.localizedDescription)

            return []
        }
    }
}
