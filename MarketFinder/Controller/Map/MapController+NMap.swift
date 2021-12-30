//
//  MapController+NMap.swift
//  MarketFinder
//
//  Created by User on 2021/11/28.
//

import Foundation
import NMapsMap

extension MapController: NMFMapViewTouchDelegate {

    // 맵 내 심볼 터치
    func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
        return false
    }
    
    // 맵 터치
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        infoWindow.close()
        
        self.showBottomView(isShowing: false)
    }
}
