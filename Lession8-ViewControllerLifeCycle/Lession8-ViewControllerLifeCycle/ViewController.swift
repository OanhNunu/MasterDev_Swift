//
//  ViewController.swift
//  Lession8-ViewControllerLifeCycle
//
//  Created by Tran Thanh Nhien on 21/06/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("🔵 view 1 DidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("🔵 view 1 Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("🔵 view 1 Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("🔵 view 1 Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("🔵 view 1 Did Disappear")
    }
    
    @IBAction func button(_ sender: Any) {
        let vc = View2Controller()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

