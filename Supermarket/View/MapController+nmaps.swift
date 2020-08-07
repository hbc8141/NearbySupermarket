//
//  MapController+nmaps.swift
//  Supermarket
//
//  Created by User on 2020/06/28.
//

import NMapsMap

extension MapController: NMFMapViewTouchDelegate {
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        self.viewModel.closeInfoWindow()
    }
}
