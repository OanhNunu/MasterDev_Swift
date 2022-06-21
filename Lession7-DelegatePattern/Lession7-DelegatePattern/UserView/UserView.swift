//
//  UserView.swift
//  Lession7-DelegatePattern
//
//  Created by Tran Thanh Nhien on 16/06/2022.
//

import UIKit

protocol UserViewDelegate: AnyObject {
    func userView(userView: UserView, didSelectedWith index: Int)
}

protocol UserViewDataSource: AnyObject {
    func userView(nameOf userView: UserView) -> String
    func userView(indexOf userView: UserView) -> Int
}

class UserView: UIView {

    weak var delegate: UserViewDelegate?
    weak var dataSource: UserViewDataSource?
    var index: Int = 0
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func tap() {
        if let delegate = delegate {
            delegate.userView(userView: self, didSelectedWith: index)
        }
    }
    
    func configView() {
        if let dataSource = dataSource {
            //set index
            index = dataSource.userView(indexOf: self)
            
            //set name
            nameLabel.text = dataSource.userView(nameOf: self)
        }
    }
    
}
