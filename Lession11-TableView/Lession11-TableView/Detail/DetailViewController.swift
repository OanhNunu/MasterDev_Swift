//
//  DetailViewController.swift
//  Lession11-TableView
//
//  Created by Tran Thanh Nhien on 17/06/2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var name: String = ""
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        
        nameLabel.text = name
        if let imageName = imageName {
            userImage.image = UIImage(named: imageName)
        }
    }

}
