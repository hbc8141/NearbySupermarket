//
//  BaseViewController.swift
//  Supermarket
//
//  Created by User on 2021/07/02.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if NetworkMonitor.shared.isConnected {
            print("You're connected internet")
        } else {
            print("You're not connected internet")
        }
    }
    
    func bindUI() -> Void {}
    
    func setupLayouts() -> Void {}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
