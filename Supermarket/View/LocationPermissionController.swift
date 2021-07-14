//
//  LocationPermissionController.swift
//  Supermarket
//
//  Created by User on 2021/07/13.
//

import UIKit

class LocationPermissionController: BaseViewController {

    // MARK: - Properties
    private let imageView:BaseImageView = BaseImageView(image: nil, contentMode: .scaleToFill)
    
    private let contentLabel:BaseLabel = BaseLabel(title: "위치 권한을 요청합", textColor: .black)

    private let requestButton:BaseButton = BaseButton(title: "클릭", backgroundColor: .blue)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubviews(views: [
            self.imageView, self.contentLabel, self.requestButton
        ])
    }
    
    // MARK: - Function
    override func setupLayouts() {
//        NSLayoutConstraint.activate([
//            self.contentLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            self.contentLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            self.contentLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
//            self.contentLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
//            
//            self.requestButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
//            self.requestButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
//            self.requestButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
//            self.requestButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
    }
    
    override func bindUI() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
