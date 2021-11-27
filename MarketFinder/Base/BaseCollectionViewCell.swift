//
//  BaseCell.swift
//  Karrot
//
//  Created by User on 2021/07/20.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.selectedBackgroundView = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayouts() -> Void {}
    
    func bindUI() -> Void {}
}
