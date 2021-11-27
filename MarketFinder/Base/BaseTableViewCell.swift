//
//  BaseTableViewCell.swift
//  Karrot
//
//  Created by User on 2021/07/16.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    // MARK: - Properties
//    var disposeBag:DisposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        self.disposeBag = DisposeBag()
//    }
    
    // MARK: - Function
    func setupLayouts() -> Void {}
    
    func bind() -> Void {}
}
