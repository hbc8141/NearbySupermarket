//
//  ItemImageCollectionView.swift
//  Karrot
//
//  Created by User on 2021/07/20.
//

import UIKit

class BaseCollectionView: UICollectionView {

    // MARK: - Life Cycle
    init(scrollDirection: UICollectionView.ScrollDirection = .vertical) {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
