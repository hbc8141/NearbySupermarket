//
//  Permission.swift
//  MarketFinder
//
//  Created by User on 2021/10/18.
//

import UIKit
import FontAwesome_swift

enum Permission {
    // 위치 권한
    case location
    case notification
    
    // 권한 제목
    var title:String {
        var text:String = ""

        switch self {
            case .location:
                text = "RequestLocationPermission"
            default:
                text = "RequestNotificationPermission"
        }
        
        return text
    }
    
    // 권한 버튼 제목
    var buttonTitle:String {
        var text:String = ""

        switch self {
            case .location:
                text = "RequestLocationPermissionButton"
            default:
                text = "RequestNotificationPermissionButton"
        }
        
        return text
    }
    
    // 권한 아이콘
    var icon:UIImage {
        let fontIcon:FontAwesome = self == Permission.location ? .mapMarkedAlt : .bell
        
        let image:UIImage = UIImage.fontAwesomeIcon(name: fontIcon, style: .solid, textColor: .black, size: CGSize(width: 250, height: 250))
        
        return image
    }
}
