//
//  BaseTableView.swift
//  Karrot
//
//  Created by User on 2021/07/16.
//

import UIKit

class BaseTableView: UITableView {

    // MARK: - Properties
    init(style: UITableView.Style = .plain) {
        super.init(frame: .zero, style: .plain)
        
        self.separatorStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
