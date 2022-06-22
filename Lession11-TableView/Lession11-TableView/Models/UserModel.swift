//
//  UserModel.swift
//  Lession11-TableView
//
//  Created by Tran Thanh Nhien on 22/06/2022.
//

import Foundation

class UserModel: Decodable {
    //biến để optional hoặc giá trị default thì không có init()
    var userName: String
    var userImage: String
    
    init(userName: String, userImage: String) {
        self.userName = userName
        self.userImage = userImage
    }
}
