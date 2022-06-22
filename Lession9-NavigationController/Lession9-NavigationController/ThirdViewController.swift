//
//  ThirdViewController.swift
//  Lession9-NavigationController
//
//  Created by Tran Thanh Nhien on 22/06/2022.
//

import UIKit

class ThirdViewController: UIViewController {

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Third"
    }
    
    //MARK: - Actions
    @IBAction func popVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popToView(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[1])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    @IBAction func popRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
