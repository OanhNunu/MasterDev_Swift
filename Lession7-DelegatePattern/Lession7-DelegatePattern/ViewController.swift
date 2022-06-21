//
//  ViewController.swift
//  Lession7-DelegatePattern
//
//  Created by Tran Thanh Nhien on 16/06/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userView = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as! UserView
        userView.frame = CGRect(x: 50, y: 50, width: 100, height: 125)
        userView.index = 10
        userView.delegate = self
        userView.dataSource = self

        view.addSubview(userView)
        userView.tap()
        userView.configView()
        
    }


}

extension ViewController: UserViewDelegate {
    func userView(userView: UserView, didSelectedWith index: Int) {
            print("Did select UserView with index \(index)")
        }
}

extension ViewController: UserViewDataSource {
    func userView(nameOf userView: UserView) -> String {
        return "oanhnt42"
    }
    
    func userView(indexOf userView: UserView) -> Int {
        return 999
    }
}
