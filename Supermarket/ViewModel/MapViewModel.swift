//
//  MapViewModel.swift
//  Supermarket
//
//  Created by User on 2020/06/28.
//

import RxSwift
import RxCocoa
import NMapsMap

class MapViewModel {
        
    // MARK: - Properties
    lazy var marketMarkers:BehaviorSubject<[NMFMarker]> = BehaviorSubject<[NMFMarker]>(value: [])

    private let infoWindow:NMFInfoWindow = {
        let infoWindow = NMFInfoWindow()
        let dataSource = NMFInfoWindowDefaultTextSource.data()
        dataSource.title = "정보 창 내용"
        infoWindow.dataSource = dataSource
        
        return infoWindow
    }()

    // 마커를 탭하면
    private lazy var handler:NMFOverlayTouchHandler = { [weak self] (overlay:NMFOverlay) -> Bool in
        if let marker = overlay as? NMFMarker {
            if marker.infoWindow == nil, let marketData:[String:String] = marker.userInfo as? [String:String] {
                // 현재 마커에 정보 창이 열려있지 않을 경우 엶
                let brand:String = marketData["brand"] ?? "Undefined"
                let name:String = marketData["name"] ?? "Undefined"

                let dataSource = NMFInfoWindowDefaultTextSource.data()
                dataSource.title = "\(brand) \(name)"
                self?.infoWindow.dataSource = dataSource

                self?.infoWindow.open(with: marker)
            } else {
                // 이미 현재 마커에 정보 창이 열려있을 경우 닫음
                self?.infoWindow.close()
            }
        }
        return true
    }

    // MARK: - Life Cycle
    init() {
        _ = MarketManager.shared.marketList
            .flatMap({ (brands:[MartBrand]) -> Observable<[NMFMarker]> in
                let markers:[[NMFMarker]] = brands.map { (martBrand:MartBrand) -> [NMFMarker] in
                    let name:String = martBrand.brand
                    let markers:[NMFMarker] = martBrand.market.map { self.martketMarkers(brand: name, $0) }
                    
                    return markers
                }

                return .just(Array(markers.joined()))
            }).bind(to: self.marketMarkers)
    }
    
    // MARK: - Function
    private func martketMarkers(brand:String, _ market: Market) -> NMFMarker {
        let location:Location = market.location
        
        let position:NMGLatLng = NMGLatLng(lat: location.lat, lng: location.lng)
        
        let marker:NMFMarker = NMFMarker(position: position)
        marker.touchHandler = self.handler
        marker.userInfo = [
            "brand" : brand,
            "name" : market.name
        ]
        print("\(brand) \(market.name)")
        return marker
    }
    
    func closeInfoWindow() -> Void {
        self.infoWindow.close()
    }
}
