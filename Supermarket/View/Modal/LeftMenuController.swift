//
//  LeftMenuController.swift
//  Supermarket
//
//  Created by User on 2020/06/28.
//

import UIKit

class LeftMenuContorller: BaseViewController {
    
    // MARK: - Properties
    private let menuView:BaseView = {
        let view:BaseView = BaseView()
        view.backgroundColor = UIColor.color(color: .white)
        
        return view
    }()
    
    private lazy var tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchUpBackgroundView(_:)))
    
    private var menuLeadingConstraint:NSLayoutConstraint?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.view.addGestureRecognizer(self.tapGesture)
        
        self.view.addSubview(menuView)
        
        self.setupLayouts()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            UIView.animate(withDuration: 0.5) {
                self.menuLeadingConstraint?.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - Objc Function
    @objc private func touchUpBackgroundView(_ gesture: UITapGestureRecognizer) -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Function
    override func setupLayouts() -> Void {
        NSLayoutConstraint.activate([
            self.menuView.topAnchor.constraint(equalTo: self.view.topAnchor),

            self.menuView.widthAnchor.constraint(equalToConstant: 200),
            self.menuView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.menuLeadingConstraint = self.menuView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -200)
        self.menuLeadingConstraint?.isActive = true
    }
}
