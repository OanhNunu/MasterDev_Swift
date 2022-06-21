//
//  View2Controller.swift
//  Lession8-ViewControllerLifeCycle
//
//  Created by Tran Thanh Nhien on 21/06/2022.
//

import UIKit

class View2Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View 2 Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("🔵 view 2 Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("🔵 view 2 Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("🔵 view 2 Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("🔵 view 2 Did Disappear")
    }
}
