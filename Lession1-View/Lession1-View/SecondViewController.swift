//
//  SecondViewController.swift
//  Lession1-View
//
//  Created by Tran Thanh Nhien on 16/06/2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet var titleLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "GHTK"
        
        for i in 0..<titleLabels.count {
            titleLabels[i].text = "Title Label \(i)"
        }
        // Do any additional setup after loading the view.
    }


}
