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
    
    private let menuButton:BaseButton = BaseButton(idle: .alignJustify, style: .solid)

    private let crosshairButton:BaseButton = {
        let crosshairButton:BaseButton = BaseButton(idle: .crosshairs, style: .solid)
        crosshairButton.backgroundColor = .white
        crosshairButton.layer.cornerRadius = 25
        
        return crosshairButton
    }()

    private var testMaker:[NMFMarker] = []
    
    private let testJson = [
        Market(id: 1, brand: .costco, name: "코스트코 양평점", location: CLLocationCoordinate2D(latitude: 37.52771436908668, longitude: 126.8920978964813)),
        Market(id: 2, brand: .emarttraders, name: "이마트트레이더스 서울신도림점", location: CLLocationCoordinate2D(latitude: 37.51837163127627, longitude: 126.89589559833051))
    ]
    
    private let bottomView:BottomView = BottomView()
    
    private var bottomViewBottomConstraint:NSLayoutConstraint = NSLayoutConstraint()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let handler = { [weak self] (overlay: NMFOverlay) -> Bool in
            guard let self = self else { return false }

            if let marker = overlay as? NMFMarker {
                // 마커를 터치할 때 정보창을 엶
                let id = marker.userInfo["id"] as? Int ?? 0
                guard let market:Market = self.testJson.first(where: { (market:Market) -> Bool in
                    return market.id == id
                }) else { return true }

                self.infoWindow.dataSource = CustomInfoWindowDataSoucre(market: market)
                self.infoWindow.open(with: marker)
                
                self.showBottomView(isShowing: true)
                
                let zoomLevel:Double = self.mapView.zoomLevel

                let cameraUpdate:NMFCameraUpdate = market.cameraUpdate(zoom: zoomLevel)
                
                self.mapView.moveCamera(cameraUpdate)
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
        
        self.view.addSubviews(views: [
            self.menuButton,
            self.crosshairButton,
            self.bottomView
        ])
        
        self.setupLayouts()
        self.bindUI()
        
        let controller = MapController()
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
    }
    
    // MARK: Override Function
    func showBottomView(isShowing: Bool) -> Void {
        UIView.animate(withDuration: 0.3) {
            self.bottomViewBottomConstraint.constant = isShowing ? 10 : 200
            self.view.layoutIfNeeded()
        }
    }
    
    override func bindUI() {
        self.crosshairButton.rx.tap
            .map { _ in NMGLatLng(lat: 37.35954179034756, lng: 127.10518346728922) }
            .map { NMFCameraUpdate(position: NMFCameraPosition($0, zoom: 15)) }
            .asDriver(onErrorJustReturn: NMFCameraUpdate())
            .drive(onNext: { camera in
                self.mapView.moveCamera(camera)
            }).disposed(by: self.disposeBag)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            self.menuButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.menuButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            self.menuButton.widthAnchor.constraint(equalToConstant: 50),
            self.menuButton.heightAnchor.constraint(equalToConstant: 50),
            
            self.crosshairButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            self.crosshairButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            self.crosshairButton.widthAnchor.constraint(equalToConstant: 50),
            self.crosshairButton.heightAnchor.constraint(equalToConstant: 50),
            
            self.bottomView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            self.bottomView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            self.bottomView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        self.bottomViewBottomConstraint = self.bottomView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 200)
        self.bottomViewBottomConstraint.isActive = true
    }
}
