//
//  User.swift
//  Lession13-CollectionView
//
//  Created by Tran Thanh Nhien on 17/06/2022.
//

import Foundation

final class User {
    var name: String
    var avatar: String
    
    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}

extension User {
    static func getDummyDatas() -> [User] {
        var users: [User] = []
        
        for i in 1...30 {
            //let user = User(name: "User \(i)", avatar: "\(i%10)")
            let user = User(name: "User: \(i)", avatar: "animeboy")
            users.append(user)
        }
        
        return users
    }
}
