//
//  LeftMenuController.swift
//  Supermarket
//
//  Created by User on 2020/06/28.
//

import UIKit

class LeftMenuContorller: UIViewController {
    
    // MARK: - Properties
    private let menuView:UIView = {
        let view:UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.color(color: .white)
        
        return view
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchUpBackgroundView(_:)))

        self.view.addGestureRecognizer(tapGesture)
        
        self.setupLayouts()
    }
    
    // MARK: - Objc Function
    @objc private func touchUpBackgroundView(_ gesture: UITapGestureRecognizer) -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Function
    private func setupLayouts() -> Void {
        NSLayoutConstraint.activate([
            self.menuView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.menuView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.menuView.widthAnchor.constraint(equalToConstant: 200),
            self.menuView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
