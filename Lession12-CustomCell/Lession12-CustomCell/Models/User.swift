//
//  User.swift
//  Lession12-CustomCell
//
//  Created by Tran Thanh Nhien on 22/06/2022.
//

import UIKit

struct User {
    var name: String
    var subtitle: String
    var img: String?
    
    init(name: String, subtitle: String, img: String) {
        self.name = name
        self.subtitle = subtitle
    }
}
