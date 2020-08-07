//
//  CustomNavController.swift
//  Supermarket
//
//  Created by User on 2020/06/28.
//

import UIKit

class CustomNavController: UINavigationController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.topItem?.title = ""
        self.navigationBar.isTranslucent = false
        self.navigationBar.isHidden = true
        
        self.changeNavBackground(shadow: true)
    }
    
    private func changeNavBackground(shadow: Bool) -> Void {
        let shadowImage:UIImage? = UIImage()
        self.navigationBar.tintColor = .white
        self.navigationBar.shadowImage = shadowImage
    }
}
