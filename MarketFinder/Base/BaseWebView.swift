//
//  BaseWebView.swift
//  Flapic
//
//  Created by User on 2021/09/27.
//

import UIKit
import WebKit

class BaseWebView: WKWebView {

    // MARK: - Initialization
    init() {
        // 자바스크립트 허용 여부설정
        let preferences:WKPreferences = WKPreferences()

        let config:WKWebViewConfiguration = WKWebViewConfiguration()
        config.preferences = preferences

        super.init(frame: .zero, configuration: config)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
