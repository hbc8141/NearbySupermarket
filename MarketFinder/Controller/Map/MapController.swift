//
//  ViewController.swift
//  MarketFinder
//
//  Created by User on 2021/10/15.
//

import UIKit
import NMapsMap
import CoreLocation

class MapController: BaseController {

    // MARK: - Properties
    let infoWindow = NMFInfoWindow()

    private let dataSource:CustomInfoWindowDataSoucre = CustomInfoWindowDataSoucre(market: Market(id: 123, brand: .costco, name: "이마트트레이더스 서울고속버스터미널점", location: CLLocationCoordinate2D(latitude: 37.35934040757114, longitude: 127.104853356072)))

    private lazy var mapView:NMFMapView = {
        let mapView:NMFMapView = NMFMapView()
        mapView.isRotateGestureEnabled = false
        mapView.maxZoomLevel = 15
        mapView.minZoomLevel = 5
        mapView.touchDelegate = self
        
        return mapView
    }()

    private var testMaker:[NMFMarker] = []
    
    private let testJson = [
        Market(id: 1, brand: .costco, name: "코스트코 양평점", location: CLLocationCoordinate2D(latitude: 37.52771436908668, longitude: 126.8920978964813)),
        Market(id: 2, brand: .emarttraders, name: "이마트트레이더스 서울신도림점", location: CLLocationCoordinate2D(latitude: 37.51837163127627, longitude: 126.89589559833051))
    ]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let handler = { [weak self] (overlay: NMFOverlay) -> Bool in
            if let marker = overlay as? NMFMarker {
                // 마커를 터치할 때 정보창을 엶
                let id = marker.userInfo["id"] as? Int ?? 0
                guard let market:Market = self?.testJson.first(where: { (market:Market) -> Bool in
                    return market.id == id
                }) else { return true }

                self?.infoWindow.dataSource = CustomInfoWindowDataSoucre(market: market)
                self?.infoWindow.open(with: marker)
            }
            return true
        }

        testMaker = testJson.map({ [weak self] (abc:Market) in
            let marker:NMFMarker = NMFMarker(position: NMGLatLng(lat: abc.location.latitude, lng: abc.location.longitude))
            marker.userInfo = ["id" : abc.id]
            marker.mapView = self?.mapView
            marker.touchHandler = handler

            return marker
        })
        
        self.view = mapView
    }
}

extension MapController: NMFMapViewTouchDelegate {

    // 맵 내 심볼 터치
    func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
        print("test")
        infoWindow.close()

        return true
    }
    
    // 맵 터치
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        infoWindow.close()
        
        print("abc")
    }
}
