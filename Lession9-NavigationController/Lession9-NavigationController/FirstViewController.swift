//
//  FirstViewController.swift
//  Lession9-NavigationController
//
//  Created by Tran Thanh Nhien on 22/06/2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First"
        setUpNavi()

    }
    
    func setUpNavi() {
        let leftButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItem = leftButton
        let leftButton1 = UIBarButtonItem(title: "Left 1", style: .plain, target: self, action: #selector(leftAction))
        let leftButton2 = UIBarButtonItem(title: "Left 2", style: .plain, target: self, action: #selector(leftAction))
        let rightButton1 = UIBarButtonItem(title: "Right1", style: .plain, target: self, action: #selector(leftAction))
        let rightButton2 = UIBarButtonItem(title: "Right2", style: .plain, target: self, action: #selector(leftAction))
                
        navigationItem.leftBarButtonItems = [leftButton1, leftButton2]
        navigationItem.rightBarButtonItems = [rightButton1, rightButton2]

    }
    
    @objc func leftAction() {
        print("taped")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View 1 will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View 1 did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View 1 will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View 1 did Disappear")
    }
    
    //MARK: - Actions
    @IBAction func pushSecondVC(_ sender: Any) {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
