//
//  CustomInfoWindow.swift
//  MarketFinder
//
//  Created by User on 2021/11/21.
//

import Foundation
import NMapsMap
import CoreLocation

struct Market {
    var id:Int = 0
    var brand:Brand = .unknown
    var name:String = "unknown"
    var location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 38, longitude: -127)
    
    init() {}

    init(id:Int, brand:Brand, name: String, location:CLLocationCoordinate2D) {
        self.id = id
        self.brand = brand
        self.name = name
        self.location = location
    }

    // 마켓 마커 클릭 시 카메라 중심 반환
    func cameraUpdate(zoom: Double) -> NMFCameraUpdate {
        let target:NMGLatLng = NMGLatLng(lat: self.location.latitude, lng: self.location.longitude)
        
        let cameraUpdate:NMFCameraUpdate = NMFCameraUpdate(position: NMFCameraPosition(target, zoom: zoom))
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 0.7
        
        return cameraUpdate
    }
}

enum Brand: String {
    case unknown
    case emart
    case emarttraders
    case costco
    case homeplus
    case lottemart
    case megamart
    
    // 브랜드 로고
    var logo:UIImage? {
        if self == .unknown {
            return nil
        }

        return UIImage(named: self.rawValue)
    }
}

class CustomInfoWindowDataSoucre: NSObject, NMFOverlayImageDataSource {

    private var rect:CGRect = .zero
    
    private var market:Market = Market()

    override init() {
        super.init()
    }
    
    init(market: Market) {
        super.init()

        self.market = market
    }
    
    func view(with overlay: NMFOverlay) -> UIView {
        let label:UILabel = UILabel()
        let font:UIFont = label.font
        
        let marketName:String = market.name

        let strSize:CGSize = (marketName as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
        let width:CGFloat = strSize.width

        let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: width + 50, height: 40))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = false

        let imageView:UIImageView = UIImageView(image: UIImage(named: "naver_logo"))
        imageView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)

        label.frame = CGRect(x: 40, y: 10, width: width, height: 20)
        label.text = marketName
        label.numberOfLines = 0
        label.textColor = .white

        view.addSubview(imageView)
        view.addSubview(label)
        
        return view
    }
}
