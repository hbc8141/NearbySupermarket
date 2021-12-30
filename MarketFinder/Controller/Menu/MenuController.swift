//
//  MenuController.swift
//  MarketFinder
//
//  Created by User on 2021/11/28.
//

import UIKit

class MenuController: BaseController {

    //  MARK: - Properties
    private let menuTableView:BaseTableView = BaseTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubviews(views: [
            self.menuTableView
        ])
        
        self.setupLayouts()
        self.bindUI()
    }
    
    // MARK: - Function
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            self.menuTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.menuTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.menuTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.menuTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    override func bindUI() {
        
    }
}
