//
//  SecondViewController.swift
//  Lession9-NavigationController
//
//  Created by Tran Thanh Nhien on 22/06/2022.
//

import UIKit

class SecondViewController: UIViewController {

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second"
        setUpNavi()
    }
    
    func setUpNavi() {
        let searchItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(tap))
        let bookMarkItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(tap))
        let settingItem = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(tap))
        
        navigationItem.rightBarButtonItems = [searchItem, bookMarkItem, settingItem]
    }
    
    @objc func tap() {
        print("tap tap")
    }

    //MARK: - Actions
    @IBAction func pushVC(_ sender: Any) {
        self.navigationController?.pushViewController(ThirdViewController(), animated: true)
    }
    
    @IBAction func popVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popToView(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[0])!
        self.navigationController?.popToViewController(vc, animated: true)
    }
    
    
}
