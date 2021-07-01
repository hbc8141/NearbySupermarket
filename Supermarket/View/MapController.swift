//
//  ViewController.swift
//  Supermarket
//
//  Created by User on 2020/06/27.
//

import UIKit
import NMapsMap
import RxSwift
import FontAwesome_swift

class MapController: BaseViewController {

    // MARK: - Properties
    private lazy var mapView:NMFMapView = {
        let mapView:NMFMapView = NMFMapView(frame: self.view.frame)
        mapView.allowsRotating = false
        mapView.allowsTilting = false
        mapView.touchDelegate = self
        
        return mapView
    }()
    
    private lazy var menuButton:BaseButton = BaseButton(fontIcon: .alignJustify, style: .solid)
    
    private let returnMyLocationButton:BaseButton = {
        let button:BaseButton = BaseButton(fontIcon: .crosshairs, style: .solid)
        button.backgroundColor = .white
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    private var cameraUpdate:NMFCameraUpdate = {
        let cameraUpdate:NMFCameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.5423752, lng: 126.951168), zoomTo: 15)
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 1.5
        
        return cameraUpdate
    }()

    let viewModel:MapViewModel = MapViewModel()
    private let disposeBag:DisposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        self.view.addSubviews(views: [
            self.mapView, self.menuButton, self.returnMyLocationButton
        ])
        
        self.setupLayouts()
        self.bindUI()
        
        self.mapView.moveCamera(cameraUpdate)
        
        LocationManager.shared.requestPermission()
    }
    
    // MARK: - Function
    override func setupLayouts() -> Void {
        if #available(iOS 11, *) {
            self.menuButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
            self.returnMyLocationButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            self.menuButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
            self.returnMyLocationButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true
        }

        NSLayoutConstraint.activate([
            self.menuButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            self.menuButton.widthAnchor.constraint(equalToConstant: 50),
            self.menuButton.heightAnchor.constraint(equalToConstant: 50),
            
            self.returnMyLocationButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            self.returnMyLocationButton.widthAnchor.constraint(equalToConstant: 50),
            self.returnMyLocationButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    override func bindUI() -> Void {
        self.menuButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .flatMap({ () -> Observable<LeftMenuContorller> in
                let leftMenuController:LeftMenuContorller = {
                    let controller:LeftMenuContorller = LeftMenuContorller()
                    controller.modalPresentationStyle = .overFullScreen
                    controller.modalTransitionStyle = .crossDissolve
                    
                    return controller
                }()
                
                return .just(leftMenuController)
            })
            .asDriver(onErrorJustReturn: LeftMenuContorller())
            .drive(onNext: { (controller:LeftMenuContorller) in
                self.present(controller, animated: true, completion: nil)
            }).disposed(by: self.disposeBag)
        
        self.returnMyLocationButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.mapView.moveCamera(self.cameraUpdate)
            }).disposed(by: self.disposeBag)
        
        self.viewModel.marketMarkers
            .flatMap({ (marker:[NMFMarker]) -> Observable<NMFMarker> in
                return Observable.from(marker)
            })
            .asDriver(onErrorJustReturn: NMFMarker())
            .drive(onNext: { (marker:NMFMarker) in
                marker.mapView = self.mapView
            }).disposed(by: self.disposeBag)
    }
}

